Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13CAA22152
	for <lists+linux-usb@lfdr.de>; Sat, 18 May 2019 04:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfERC4o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 May 2019 22:56:44 -0400
Received: from out01.mta.xmission.com ([166.70.13.231]:51263 "EHLO
        out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfERC4n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 May 2019 22:56:43 -0400
X-Greylist: delayed 4660 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 May 2019 22:56:40 EDT
Received: from in01.mta.xmission.com ([166.70.13.51])
        by out01.mta.xmission.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.87)
        (envelope-from <ebiederm@xmission.com>)
        id 1hRoJP-0001Ys-Mg; Fri, 17 May 2019 19:38:59 -0600
Received: from ip72-206-97-68.om.om.cox.net ([72.206.97.68] helo=x220.xmission.com)
        by in01.mta.xmission.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.87)
        (envelope-from <ebiederm@xmission.com>)
        id 1hRoJO-0008JK-0G; Fri, 17 May 2019 19:38:59 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        <linux-kernel@vger.kernel.org>
References: <Pine.LNX.4.44L0.1902081652080.1482-200000@iolanthe.rowland.org>
Date:   Fri, 17 May 2019 20:38:34 -0500
In-Reply-To: <Pine.LNX.4.44L0.1902081652080.1482-200000@iolanthe.rowland.org>
        (Alan Stern's message of "Fri, 8 Feb 2019 16:57:27 -0500 (EST)")
Message-ID: <87y334v8x1.fsf@xmission.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-XM-SPF: eid=1hRoJO-0008JK-0G;;;mid=<87y334v8x1.fsf@xmission.com>;;;hst=in01.mta.xmission.com;;;ip=72.206.97.68;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX18l9787xi5ILdaNwwKktcW5P+wq93aEoYE=
X-SA-Exim-Connect-IP: 72.206.97.68
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa08.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,FVGT_m_MULTI_ODD,TR_Symld_Words,
        T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,XMGappySubj_01,XMGappySubj_02,
        XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  1.5 TR_Symld_Words too many words that have symbols inside
        *  0.5 XMGappySubj_01 Very gappy subject
        *  0.7 XMSubLong Long Subject
        *  1.0 XMGappySubj_02 Gappier still
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa08 1397; Body=1 Fuz1=1 Fuz2=1]
        *  0.0 T_TooManySym_01 4+ unique symbols in subject
        *  0.4 FVGT_m_MULTI_ODD Contains multiple odd letter combinations
X-Spam-DCC: XMission; sa08 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Alan Stern <stern@rowland.harvard.edu>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1200 ms - load_scoreonly_sql: 0.05 (0.0%),
        signal_user_changed: 6 (0.5%), b_tie_ro: 4.4 (0.4%), parse: 2.3 (0.2%),
         extract_message_metadata: 27 (2.3%), get_uri_detail_list: 9 (0.8%),
        tests_pri_-1000: 28 (2.3%), tests_pri_-950: 1.40 (0.1%),
        tests_pri_-900: 1.24 (0.1%), tests_pri_-90: 74 (6.2%), check_bayes: 71
        (5.9%), b_tokenize: 26 (2.2%), b_tok_get_all: 22 (1.9%), b_comp_prob:
        7 (0.6%), b_tok_touch_all: 8 (0.6%), b_finish: 1.03 (0.1%),
        tests_pri_0: 1044 (87.0%), check_dkim_signature: 1.32 (0.1%),
        check_dkim_adsp: 3.5 (0.3%), poll_dns_idle: 1.16 (0.1%), tests_pri_10:
        2.3 (0.2%), tests_pri_500: 8 (0.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [CFT][PATCH] signal/usb: Replace kill_pid_info_as_cred with kill_pid_usb_asyncio
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain

Alan Stern <stern@rowland.harvard.edu> writes:

> On Thu, 7 Feb 2019, Eric W. Biederman wrote:
>
>> The usb support for asyncio encoded one of it's values in the wrong
>> field.  It should have used si_value but instead used si_addr which is
>> not present in the _rt union member of struct siginfo.
>> 
>> The result is a POSIX and glibc incompatible encoding of fields in
>> struct siginfo with si_code of SI_ASYNCIO.  This makes it impossible
>> to look at a struct siginfo with si_code set to SI_ASYNCIO and without
>> context properly decode it.  Which unfortunately means that
>> copy_siginfo_to_user32 can't handle the compat issues this unfortunate
>> choice in encodings brings up.
>> 
>> Therefore replace kill_pid_info_as_cred with kill_pid_usb_asyncio a
>> dedicated function for this one specific case.  There are no other
>> users of kill_pid_info_as_cred so this specialization should have no
>> impact on the amont of code in the kernel.  Have kill_pid_usb_asyncio
>> take instead of a siginfo_t which is difficult error prone 3
>> arguments, a signal number, an errno value, and an address enconded as
>> a sigval_t.  The encoding as a sigval_t allows the caller to deal with
>> the compat issues before calling kill_pid_info_as_cred.
>> 
>> Add BUILD_BUG_ONs in kernel/signal.c to ensure that we can now place
>> the pointer value at the in si_pid (instead of si_addr) and get
>> the same binary result when the structure is copied to user space
>> and when the structure is copied field by field.
>> 
>> The usb code is updated to track if the values it passes into
>> kill_pid_usb_asyncio were passed to it from a native userspace
>> or from at compat user space.  To allow a proper conversion
>> of the addresses.
>> 
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: linux-usb@vger.kernel.org
>> Cc: Alan Stern <stern@rowland.harvard.edu>
>> Cc: Oliver Neukum <oneukum@suse.com>
>> Fixes: v2.3.39
>> Cc: stable@vger.kernel.org
>> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
>> ---
>> 
>> Can I get someone to test this code?  I just discovered that the
>> usb code is filling in struct siginfo wrong and copy_siginfo_to_user32
>> can't possibly get this correct without some help.
>> 
>> I think I have coded up a working fix.  But I don't have a setup
>> where I can test this.
>
> Eric:
>
> You should be able to test this patch by running the attached 
> program.  It takes one argument, the pathname to a USB device file.  
> For example, on my system:
>
> # ./usbsig /dev/bus/usb/001/001
> Got signal 10, signo 10 errno 0 code -4
>
> I don't know exactly what you're looking for, but it should be pretty 
> easy to modify the test program however you want.
>
> If you need to test the compatibility mode specifically, I can do that
> here -- I'm running a 32-bit userspace on a 64-bit kernel.  But you'll
> have to tell me exactly what test code to run.

Wow I got a little distracted but now I am back to this.

Using your test program I was able to test the basics of this.

I found one bug in my patch where I was missing a memset.  So I have
corrected that, and reorganized the patch a little bit.

I have not figured out how to trigger a usb disconnect so I have not
tested that.

The big thing I have not been able to test is running a 64bit big-endian
kernel with a 32bit user space.  My modified version of your test
program should report "Bad" without my patch, and should report "Good"
with it.

Is there any chance you can test that configuration?  I could not figure
out how to get a 64bit big-endian system running in qemu, and I don't
have the necessary hardware so I was not able to test that at all.  As
that is the actual bug I am still hoping someone can test it.

Thank you,
Eric Biederman
---

--=-=-=
Content-Type: text/plain
Content-Disposition: inline; filename=usbsig.c

/* usbsig.c -- test USB async signal delivery */

#include <stdio.h>
#include <fcntl.h>
#include <signal.h>
#include <string.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <linux/usb/ch9.h>
#include <linux/usbdevice_fs.h>

static struct usbdevfs_urb urb;
static struct usbdevfs_disconnectsignal ds;

void urb_handler(int sig, siginfo_t *info , void *ucontext)
{
	printf("Got signal %d, signo %d errno %d code %d addr: %p urb: %p\n",
	       sig, info->si_signo, info->si_errno, info->si_code,
	       info->si_addr, &urb);

	printf("%s\n", (info->si_addr == &urb) ? "Good" : "Bad");
}

void ds_handler(int sig, siginfo_t *info , void *ucontext)
{
	printf("Got signal %d, signo %d errno %d code %d addr: %p ds: %p\n",
	       sig, info->si_signo, info->si_errno, info->si_code,
	       info->si_addr, &ds);

	printf("%s\n", (info->si_addr == &ds) ? "Good" : "Bad");
}

int main(int argc, char **argv)
{
	char *devfilename;
	int fd;
	int rc;
	struct sigaction act;
	struct usb_ctrlrequest *req;
	void *ptr;
	char buf[80];

	if (argc != 2) {
		fprintf(stderr, "Usage: usbsig device-file-name\n");
		return 1;
	}

	devfilename = argv[1];
	fd = open(devfilename, O_RDWR);
	if (fd == -1) {
		perror("Error opening device file");
		return 1;
	}

	act.sa_sigaction = urb_handler;
	sigemptyset(&act.sa_mask);
	act.sa_flags = SA_SIGINFO;

	rc = sigaction(SIGUSR1, &act, NULL);
	if (rc == -1) {
		perror("Error in sigaction");
		return 1;
	}

	act.sa_sigaction = ds_handler;
	sigemptyset(&act.sa_mask);
	act.sa_flags = SA_SIGINFO;

	rc = sigaction(SIGUSR2, &act, NULL);
	if (rc == -1) {
		perror("Error in sigaction");
		return 1;
	}

	memset(&urb, 0, sizeof(urb));
	urb.type = USBDEVFS_URB_TYPE_CONTROL;
	urb.endpoint = USB_DIR_IN | 0;
	urb.buffer = buf;
	urb.buffer_length = sizeof(buf);
	urb.signr = SIGUSR1;

	req = (struct usb_ctrlrequest *) buf;
	req->bRequestType = USB_DIR_IN | USB_TYPE_STANDARD | USB_RECIP_DEVICE;
	req->bRequest = USB_REQ_GET_DESCRIPTOR;
	req->wValue = USB_DT_DEVICE << 8;
	req->wIndex = 0;
	req->wLength = sizeof(buf) - sizeof(*req);

	rc = ioctl(fd, USBDEVFS_SUBMITURB, &urb);
	if (rc == -1) {
		perror("Error in SUBMITURB ioctl");
		return 1;
	}

	rc = ioctl(fd, USBDEVFS_REAPURB, &ptr);
	if (rc == -1) {
		perror("Error in REAPURB ioctl");
		return 1;
	}

	memset(&ds, 0, sizeof(ds));
	ds.signr = SIGUSR2;
	ds.context = &ds;
	rc = ioctl(fd, USBDEVFS_DISCSIGNAL, &ds);
	if (rc == -1) {
		perror("Error in DISCSIGNAL ioctl");
		return 1;
	}

	close(fd);
	return 0;
}


--=-=-=
Content-Type: text/plain
Content-Disposition: inline;
 filename=0001-signal-usb-Replace-kill_pid_info_as_cred-with-kill_p.patch

From 0045109b65f32f4228072359282d2f8613fc8964 Mon Sep 17 00:00:00 2001
From: "Eric W. Biederman" <ebiederm@xmission.com>
Date: Thu, 7 Feb 2019 19:44:12 -0600
Subject: [PATCH] signal/usb: Replace kill_pid_info_as_cred with
 kill_pid_usb_asyncio

The usb support for asyncio encoded one of it's values in the wrong
field.  It should have used si_value but instead used si_addr which is
not present in the _rt union member of struct siginfo.

The result is a POSIX and glibc incompatible encoding of fields in
struct siginfo with si_code of SI_ASYNCIO.  This makes it impossible
to look at a struct siginfo with si_code set to SI_ASYNCIO and without
context properly decode it.  Which unfortunately means that
copy_siginfo_to_user32 can't handle the compat issues this unfortunate
choice in encodings brings up.

Therefore replace kill_pid_info_as_cred with kill_pid_usb_asyncio a
dedicated function for this one specific case.  There are no other
users of kill_pid_info_as_cred so this specialization should have no
impact on the amount of code in the kernel.  Have kill_pid_usb_asyncio
take instead of a siginfo_t which is difficult and error prone, 3
arguments, a signal number, an errno value, and an address enconded as
a sigval_t.  The encoding of the address as a sigval_t allows the
caller to deal with the compat issues before calling
kill_pid_info_as_cred.

Add BUILD_BUG_ONs in kernel/signal.c to ensure that we can now place
the pointer value at the in si_pid (instead of si_addr).  That is the
code now verifies that si_pid and si_addr always occur at the same
location.  Further the code veries that for native structures a value
placed in si_pid and spilling into si_uid will appear in userspace in
si_addr (on a byte by byte copy of siginfo or a field by field copy of
siginfo).  The code also verifies that for a 64bit kernel and a 32bit
userspace the 32bit pointer will fit in si_pid.

The usb code is updated to compute the sigval_t to pass to
kill_pid_usb_asyncio when the signals are registered with
the usb layer.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>
Fixes: v2.3.39
Cc: stable@vger.kernel.org
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 drivers/usb/core/devio.c     | 48 ++++++++++++-------------
 include/linux/sched/signal.h |  2 +-
 kernel/signal.c              | 69 +++++++++++++++++++++++++++++++-----
 3 files changed, 86 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index fa783531ee88..a02448105527 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -63,7 +63,7 @@ struct usb_dev_state {
 	unsigned int discsignr;
 	struct pid *disc_pid;
 	const struct cred *cred;
-	void __user *disccontext;
+	sigval_t disccontext;
 	unsigned long ifclaimed;
 	u32 disabled_bulk_eps;
 	bool privileges_dropped;
@@ -90,6 +90,7 @@ struct async {
 	unsigned int ifnum;
 	void __user *userbuffer;
 	void __user *userurb;
+	sigval_t userurb_sigval;
 	struct urb *urb;
 	struct usb_memory *usbm;
 	unsigned int mem_usage;
@@ -582,22 +583,19 @@ static void async_completed(struct urb *urb)
 {
 	struct async *as = urb->context;
 	struct usb_dev_state *ps = as->ps;
-	struct kernel_siginfo sinfo;
 	struct pid *pid = NULL;
 	const struct cred *cred = NULL;
 	unsigned long flags;
-	int signr;
+	sigval_t addr;
+	int signr, errno;
 
 	spin_lock_irqsave(&ps->lock, flags);
 	list_move_tail(&as->asynclist, &ps->async_completed);
 	as->status = urb->status;
 	signr = as->signr;
 	if (signr) {
-		clear_siginfo(&sinfo);
-		sinfo.si_signo = as->signr;
-		sinfo.si_errno = as->status;
-		sinfo.si_code = SI_ASYNCIO;
-		sinfo.si_addr = as->userurb;
+		errno = as->status;
+		addr = as->userurb_sigval;
 		pid = get_pid(as->pid);
 		cred = get_cred(as->cred);
 	}
@@ -615,7 +613,7 @@ static void async_completed(struct urb *urb)
 	spin_unlock_irqrestore(&ps->lock, flags);
 
 	if (signr) {
-		kill_pid_info_as_cred(sinfo.si_signo, &sinfo, pid, cred);
+		kill_pid_usb_asyncio(signr, errno, addr, pid, cred);
 		put_pid(pid);
 		put_cred(cred);
 	}
@@ -1427,7 +1425,7 @@ find_memory_area(struct usb_dev_state *ps, const struct usbdevfs_urb *uurb)
 
 static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb,
 			struct usbdevfs_iso_packet_desc __user *iso_frame_desc,
-			void __user *arg)
+			void __user *arg, sigval_t userurb_sigval)
 {
 	struct usbdevfs_iso_packet_desc *isopkt = NULL;
 	struct usb_host_endpoint *ep;
@@ -1727,6 +1725,7 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
 	isopkt = NULL;
 	as->ps = ps;
 	as->userurb = arg;
+	as->userurb_sigval = userurb_sigval;
 	if (as->usbm) {
 		unsigned long uurb_start = (unsigned long)uurb->buffer;
 
@@ -1801,13 +1800,17 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
 static int proc_submiturb(struct usb_dev_state *ps, void __user *arg)
 {
 	struct usbdevfs_urb uurb;
+	sigval_t userurb_sigval;
 
 	if (copy_from_user(&uurb, arg, sizeof(uurb)))
 		return -EFAULT;
 
+	memset(&userurb_sigval, 0, sizeof(userurb_sigval));
+	userurb_sigval.sival_ptr = arg;
+
 	return proc_do_submiturb(ps, &uurb,
 			(((struct usbdevfs_urb __user *)arg)->iso_frame_desc),
-			arg);
+			arg, userurb_sigval);
 }
 
 static int proc_unlinkurb(struct usb_dev_state *ps, void __user *arg)
@@ -1977,7 +1980,7 @@ static int proc_disconnectsignal_compat(struct usb_dev_state *ps, void __user *a
 	if (copy_from_user(&ds, arg, sizeof(ds)))
 		return -EFAULT;
 	ps->discsignr = ds.signr;
-	ps->disccontext = compat_ptr(ds.context);
+	ps->disccontext.sival_int = ds.context;
 	return 0;
 }
 
@@ -2005,13 +2008,17 @@ static int get_urb32(struct usbdevfs_urb *kurb,
 static int proc_submiturb_compat(struct usb_dev_state *ps, void __user *arg)
 {
 	struct usbdevfs_urb uurb;
+	sigval_t userurb_sigval;
 
 	if (get_urb32(&uurb, (struct usbdevfs_urb32 __user *)arg))
 		return -EFAULT;
 
+	memset(&userurb_sigval, 0, sizeof(userurb_sigval));
+	userurb_sigval.sival_int = ptr_to_compat(arg);
+
 	return proc_do_submiturb(ps, &uurb,
 			((struct usbdevfs_urb32 __user *)arg)->iso_frame_desc,
-			arg);
+			arg, userurb_sigval);
 }
 
 static int processcompl_compat(struct async *as, void __user * __user *arg)
@@ -2092,7 +2099,7 @@ static int proc_disconnectsignal(struct usb_dev_state *ps, void __user *arg)
 	if (copy_from_user(&ds, arg, sizeof(ds)))
 		return -EFAULT;
 	ps->discsignr = ds.signr;
-	ps->disccontext = ds.context;
+	ps->disccontext.sival_ptr = ds.context;
 	return 0;
 }
 
@@ -2614,22 +2621,15 @@ const struct file_operations usbdev_file_operations = {
 static void usbdev_remove(struct usb_device *udev)
 {
 	struct usb_dev_state *ps;
-	struct kernel_siginfo sinfo;
 
 	while (!list_empty(&udev->filelist)) {
 		ps = list_entry(udev->filelist.next, struct usb_dev_state, list);
 		destroy_all_async(ps);
 		wake_up_all(&ps->wait);
 		list_del_init(&ps->list);
-		if (ps->discsignr) {
-			clear_siginfo(&sinfo);
-			sinfo.si_signo = ps->discsignr;
-			sinfo.si_errno = EPIPE;
-			sinfo.si_code = SI_ASYNCIO;
-			sinfo.si_addr = ps->disccontext;
-			kill_pid_info_as_cred(ps->discsignr, &sinfo,
-					ps->disc_pid, ps->cred);
-		}
+		if (ps->discsignr)
+			kill_pid_usb_asyncio(ps->discsignr, EPIPE, ps->disccontext,
+					     ps->disc_pid, ps->cred);
 	}
 }
 
diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
index e412c092c1e8..c735113f7d93 100644
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -328,7 +328,7 @@ extern void force_sigsegv(int sig, struct task_struct *p);
 extern int force_sig_info(int, struct kernel_siginfo *, struct task_struct *);
 extern int __kill_pgrp_info(int sig, struct kernel_siginfo *info, struct pid *pgrp);
 extern int kill_pid_info(int sig, struct kernel_siginfo *info, struct pid *pid);
-extern int kill_pid_info_as_cred(int, struct kernel_siginfo *, struct pid *,
+extern int kill_pid_usb_asyncio(int sig, int errno, sigval_t addr, struct pid *,
 				const struct cred *);
 extern int kill_pgrp(struct pid *pid, int sig, int priv);
 extern int kill_pid(struct pid *pid, int sig, int priv);
diff --git a/kernel/signal.c b/kernel/signal.c
index 227ba170298e..101820939baf 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1436,13 +1436,44 @@ static inline bool kill_as_cred_perm(const struct cred *cred,
 	       uid_eq(cred->uid, pcred->uid);
 }
 
-/* like kill_pid_info(), but doesn't use uid/euid of "current" */
-int kill_pid_info_as_cred(int sig, struct kernel_siginfo *info, struct pid *pid,
-			 const struct cred *cred)
+/*
+ * The usb asyncio usage of siginfo is wrong.  The glibc support
+ * for asyncio which uses SI_ASYNCIO assumes the layout is SIL_RT.
+ * AKA after the generic fields:
+ *	kernel_pid_t	si_pid;
+ *	kernel_uid32_t	si_uid;
+ *	sigval_t	si_value;
+ *
+ * Unfortunately when usb generates SI_ASYNCIO it assumes the layout
+ * after the generic fields is:
+ *	void __user 	*si_addr;
+ *
+ * This is a practical problem when there is a 64bit big endian kernel
+ * and a 32bit userspace.  As the 32bit address will encoded in the low
+ * 32bits of the pointer.  Those low 32bits will be stored at higher
+ * address than appear in a 32 bit pointer.  So userspace will not
+ * see the address it was expecting for it's completions.
+ *
+ * There is nothing in the encoding that can allow
+ * copy_siginfo_to_user32 to detect this confusion of formats, so
+ * handle this by requiring the caller of kill_pid_usb_asyncio to
+ * notice when this situration takes place and to store the 32bit
+ * pointer in sival_int, instead of sival_addr of the sigval_t addr
+ * parameter.
+ */
+int kill_pid_usb_asyncio(int sig, int errno, sigval_t addr,
+			 struct pid *pid, const struct cred *cred)
 {
-	int ret = -EINVAL;
+	struct kernel_siginfo info;
 	struct task_struct *p;
 	unsigned long flags;
+	int ret = -EINVAL;
+
+	clear_siginfo(&info);
+	info.si_signo = sig;
+	info.si_errno = errno;
+	info.si_code = SI_ASYNCIO;
+	*((sigval_t *)&info.si_pid) = addr;
 
 	if (!valid_signal(sig))
 		return ret;
@@ -1453,17 +1484,17 @@ int kill_pid_info_as_cred(int sig, struct kernel_siginfo *info, struct pid *pid,
 		ret = -ESRCH;
 		goto out_unlock;
 	}
-	if (si_fromuser(info) && !kill_as_cred_perm(cred, p)) {
+	if (!kill_as_cred_perm(cred, p)) {
 		ret = -EPERM;
 		goto out_unlock;
 	}
-	ret = security_task_kill(p, info, sig, cred);
+	ret = security_task_kill(p, &info, sig, cred);
 	if (ret)
 		goto out_unlock;
 
 	if (sig) {
 		if (lock_task_sighand(p, &flags)) {
-			ret = __send_signal(sig, info, p, PIDTYPE_TGID, 0);
+			ret = __send_signal(sig, &info, p, PIDTYPE_TGID, 0);
 			unlock_task_sighand(p, &flags);
 		} else
 			ret = -ESRCH;
@@ -1472,7 +1503,7 @@ int kill_pid_info_as_cred(int sig, struct kernel_siginfo *info, struct pid *pid,
 	rcu_read_unlock();
 	return ret;
 }
-EXPORT_SYMBOL_GPL(kill_pid_info_as_cred);
+EXPORT_SYMBOL_GPL(kill_pid_usb_asyncio);
 
 /*
  * kill_something_info() interprets pid in interesting ways just like kill(2).
@@ -4408,6 +4439,28 @@ static inline void siginfo_buildtime_checks(void)
 	CHECK_OFFSET(si_syscall);
 	CHECK_OFFSET(si_arch);
 #undef CHECK_OFFSET
+
+	/* usb asyncio */
+	BUILD_BUG_ON(offsetof(struct siginfo, si_pid) !=
+		     offsetof(struct siginfo, si_addr));
+	if (sizeof(int) == sizeof(void __user *)) {
+		BUILD_BUG_ON(sizeof_field(struct siginfo, si_pid) !=
+			     sizeof(void __user *));
+	} else {
+		BUILD_BUG_ON((sizeof_field(struct siginfo, si_pid) +
+			      sizeof_field(struct siginfo, si_uid)) !=
+			     sizeof(void __user *));
+		BUILD_BUG_ON(offsetofend(struct siginfo, si_pid) !=
+			     offsetof(struct siginfo, si_uid));
+	}
+#ifdef CONFIG_COMPAT
+	BUILD_BUG_ON(offsetof(struct compat_siginfo, si_pid) !=
+		     offsetof(struct compat_siginfo, si_addr));
+	BUILD_BUG_ON(sizeof_field(struct compat_siginfo, si_pid) !=
+		     sizeof(compat_uptr_t));
+	BUILD_BUG_ON(sizeof_field(struct compat_siginfo, si_pid) !=
+		     sizeof_field(struct siginfo, si_pid));
+#endif
 }
 
 void __init signals_init(void)
-- 
2.17.1


--=-=-=--
