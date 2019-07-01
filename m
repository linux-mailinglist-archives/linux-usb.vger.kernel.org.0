Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC6325169
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 16:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbfEUOCo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 10:02:44 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:33008 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728317AbfEUOCo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 10:02:44 -0400
Received: (qmail 1899 invoked by uid 2102); 21 May 2019 10:02:43 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 May 2019 10:02:43 -0400
Date:   Tue, 21 May 2019 10:02:43 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Eric W. Biederman" <ebiederm@xmission.com>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] signal/usb: Replace kill_pid_info_as_cred with
 kill_pid_usb_asyncio
In-Reply-To: <877eakou9o.fsf@xmission.com>
Message-ID: <Pine.LNX.4.44L0.1905211000310.1634-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 21 May 2019, Eric W. Biederman wrote:

> The usb support for asyncio encoded one of it's values in the wrong
> field.  It should have used si_value but instead used si_addr which is
> not present in the _rt union member of struct siginfo.
> 
> The practical result of this is that on a 64bit big endian kernel
> when delivering a signal to a 32bit process the si_addr field
> is set to NULL, instead of the expected pointer value.
> 
> This issue can not be fixed in copy_siginfo_to_user32 as the usb
> usage of the the _sigfault (aka si_addr) member of the siginfo
> union when SI_ASYNCIO is set is incompatible with the POSIX and
> glibc usage of the _rt member of the siginfo union.
> 
> Therefore replace kill_pid_info_as_cred with kill_pid_usb_asyncio a
> dedicated function for this one specific case.  There are no other
> users of kill_pid_info_as_cred so this specialization should have no
> impact on the amount of code in the kernel.  Have kill_pid_usb_asyncio
> take instead of a siginfo_t which is difficult and error prone, 3
> arguments, a signal number, an errno value, and an address enconded as
> a sigval_t.  The encoding of the address as a sigval_t allows the
> code that reads the userspace request for a signal to handle this
> compat issue along with all of the other compat issues.
> 
> Add BUILD_BUG_ONs in kernel/signal.c to ensure that we can now place
> the pointer value at the in si_pid (instead of si_addr).  That is the
> code now verifies that si_pid and si_addr always occur at the same
> location.  Further the code veries that for native structures a value
> placed in si_pid and spilling into si_uid will appear in userspace in
> si_addr (on a byte by byte copy of siginfo or a field by field copy of
> siginfo).  The code also verifies that for a 64bit kernel and a 32bit
> userspace the 32bit pointer will fit in si_pid.
> 
> I have used the usbsig.c program below written by Alan Stern and
> slightly tweaked by me to run on a big endian machine to verify the
> issue exists (on sparc64) and to confirm the patch below fixes the issue.
> 
> /* usbsig.c -- test USB async signal delivery */
> 
> static struct usbdevfs_urb urb;
> static struct usbdevfs_disconnectsignal ds;
> static volatile sig_atomic_t done = 0;
> 
> void urb_handler(int sig, siginfo_t *info , void *ucontext)
> {
> 	printf("Got signal %d, signo %d errno %d code %d addr: %p urb: %p\n",
> 	       sig, info->si_signo, info->si_errno, info->si_code,
> 	       info->si_addr, &urb);
> 
> 	printf("%s\n", (info->si_addr == &urb) ? "Good" : "Bad");
> }
> 
> void ds_handler(int sig, siginfo_t *info , void *ucontext)
> {
> 	printf("Got signal %d, signo %d errno %d code %d addr: %p ds: %p\n",
> 	       sig, info->si_signo, info->si_errno, info->si_code,
> 	       info->si_addr, &ds);
> 
> 	printf("%s\n", (info->si_addr == &ds) ? "Good" : "Bad");
> 	done = 1;
> }
> 
> int main(int argc, char **argv)
> {
> 	char *devfilename;
> 	int fd;
> 	int rc;
> 	struct sigaction act;
> 	struct usb_ctrlrequest *req;
> 	void *ptr;
> 	char buf[80];
> 
> 	if (argc != 2) {
> 		fprintf(stderr, "Usage: usbsig device-file-name\n");
> 		return 1;
> 	}
> 
> 	devfilename = argv[1];
> 	fd = open(devfilename, O_RDWR);
> 	if (fd == -1) {
> 		perror("Error opening device file");
> 		return 1;
> 	}
> 
> 	act.sa_sigaction = urb_handler;
> 	sigemptyset(&act.sa_mask);
> 	act.sa_flags = SA_SIGINFO;
> 
> 	rc = sigaction(SIGUSR1, &act, NULL);
> 	if (rc == -1) {
> 		perror("Error in sigaction");
> 		return 1;
> 	}
> 
> 	act.sa_sigaction = ds_handler;
> 	sigemptyset(&act.sa_mask);
> 	act.sa_flags = SA_SIGINFO;
> 
> 	rc = sigaction(SIGUSR2, &act, NULL);
> 	if (rc == -1) {
> 		perror("Error in sigaction");
> 		return 1;
> 	}
> 
> 	memset(&urb, 0, sizeof(urb));
> 	urb.type = USBDEVFS_URB_TYPE_CONTROL;
> 	urb.endpoint = USB_DIR_IN | 0;
> 	urb.buffer = buf;
> 	urb.buffer_length = sizeof(buf);
> 	urb.signr = SIGUSR1;
> 
> 	req = (struct usb_ctrlrequest *) buf;
> 	req->bRequestType = USB_DIR_IN | USB_TYPE_STANDARD | USB_RECIP_DEVICE;
> 	req->bRequest = USB_REQ_GET_DESCRIPTOR;
> 	req->wValue = htole16(USB_DT_DEVICE << 8);
> 	req->wIndex = htole16(0);
> 	req->wLength = htole16(sizeof(buf) - sizeof(*req));

In fact, these values are supposed to be in host-endian order, not 
necessarily little-endian.  The USB core converts them if necessary.

> 	rc = ioctl(fd, USBDEVFS_SUBMITURB, &urb);
> 	if (rc == -1) {
> 		perror("Error in SUBMITURB ioctl");
> 		return 1;
> 	}
> 
> 	rc = ioctl(fd, USBDEVFS_REAPURB, &ptr);
> 	if (rc == -1) {
> 		perror("Error in REAPURB ioctl");
> 		return 1;
> 	}
> 
> 	memset(&ds, 0, sizeof(ds));
> 	ds.signr = SIGUSR2;
> 	ds.context = &ds;
> 	rc = ioctl(fd, USBDEVFS_DISCSIGNAL, &ds);
> 	if (rc == -1) {
> 		perror("Error in DISCSIGNAL ioctl");
> 		return 1;
> 	}
> 
> 	printf("Waiting for usb disconnect\n");
> 	while (!done) {
> 		sleep(1);
> 	}
> 
> 	close(fd);
> 	return 0;
> }
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Oliver Neukum <oneukum@suse.com>
> Fixes: v2.3.39
> Cc: stable@vger.kernel.org
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> ---
> 
> I managed to wrestle a sparc64 qemu to the ground so I could verify this
> bug exists and the patch below fixes it.
> 
> Can I get an Ack from the usb side of things?

Give me some time to review the description and the changes.

Alan Stern

