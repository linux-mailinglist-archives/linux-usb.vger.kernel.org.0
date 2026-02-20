Return-Path: <linux-usb+bounces-33501-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PABJKImmGlcBwMAu9opvQ
	(envelope-from <linux-usb+bounces-33501-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:17:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DEE166139
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AA8530177A0
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB32313281;
	Fri, 20 Feb 2026 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtwLOvR8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEA413D53C
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579007; cv=none; b=D3+pWtiucRmsPm3xfycSUNiy/0PhzKAcawdt0IFZ2HTuI2fb2muAkbcub6iDBXbp2nbe+BCzyPj2dhxLoYxVLOoKTsqiONgBX13gs4KqagPe1osadPhP2ZlAB2F75dbCJfa0cO5WZDXFqmklTvfZ4zkL6s9mekXnoQaXvz26N6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579007; c=relaxed/simple;
	bh=KjcbiPDsBwH3APF2/ZQHQeY8Oj+ZSCgoZRYSNSNBOKs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mBJoFXo6D39so+PKN4NoLFqSwj7vs3NrxJh9zMcZ3/m0I5YY8qHYlHkqk3vDSOy9quewGCSer0bqnJtgdPjFWdrGFF6InOklrBwvqmcAeZPRyu680fn2ZsttQWP79vyfYAWe4bivlnI9w2OTKVDC29DsPYI8kndb9KJWIMIRAkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtwLOvR8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E26CC116C6
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579007;
	bh=KjcbiPDsBwH3APF2/ZQHQeY8Oj+ZSCgoZRYSNSNBOKs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UtwLOvR8YCIfdMDTwsYc413B4vT8uSBstgBxOMOhPdZSKnJAFCK4GltfsgpFGkDk+
	 fO3sWGTfRbEs2UKBkGPCVkMnVOUmnTHmXUjCIjjaVvAX2TdyCp/fZpEZrOs8GjJtxt
	 zvn5mVb3xdakoxBgfrg63liBkZb0DiDJkovfLcIJHuQO7HJixJpQm7LJaOzpG1jWKi
	 Em77ueaGvn70S3SRnymjbQRMARwiII/Y/XDWlLzysLMDv4VR/Z/kLhPplh/Ihjgvx5
	 +SXndx4bkry/3igmxv7J5pmbQq75YMNmduUQRD/CsUct/E1ZHD+ZL2AeS1vVmuazf0
	 ToX2JP7OfSp4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5256ACAB780; Fri, 20 Feb 2026 09:16:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 09:16:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@unnservice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-kIm9aCtnxc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33501-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,unnservice.com:email]
X-Rspamd-Queue-Id: E4DEE166139
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #3 from Paul Alesius (paul@unnservice.com) ---
Sorry, you may be right that the bug is elsewhere. I just triggered it again
without O_RDWR using a program that also logs the exact point of the freeze.

1. It's always on opening the same USB root hub on my machine.
2. The freeze always occurs on the "    Opening device..."
3. The ioctl seems to complete on the device where the freeze occurs.

PS/2 - We don't have PS/2 ports on these MBs
SysRq - I don't have that on my Logitech Mechanical keyboard

I just tried with "dmesg -W" (follow mode so it prints messages directly) a=
nd
it didn't print anything before the system freeze, and there's nothing in t=
he
logs, reflecting the experience of the others in the ADB bug report.


Here's the last logged line from the program before the freeze:


Iteration 189 complete =E2=80=94 attempted 9 devices
------------------------------------------------
=3D=3D=3D Starting iteration 190 =3D=3D=3D
Processing bus 011
  Device: /dev/bus/usb/011/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd
Processing bus 010
  Device: /dev/bus/usb/010/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd
Processing bus 009
  Device: /dev/bus/usb/009/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd
Processing bus 008
  Device: /dev/bus/usb/008/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd
Processing bus 007
  Device: /dev/bus/usb/007/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd
Processing bus 006
  Device: /dev/bus/usb/006/001
    Opening device...
    Open failed: Invalid argument
Processing bus 005
  Device: /dev/bus/usb/005/001
    Opening device...
    Open failed: Invalid argument
Processing bus 004
  Device: /dev/bus/usb/004/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd
Processing bus 003
  Device: /dev/bus/usb/003/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd
Processing bus 002
  Device: /dev/bus/usb/002/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd
Processing bus 001
  Device: /dev/bus/usb/001/004
    Opening device...
    Skipping non-root hub device
  Device: /dev/bus/usb/001/003
    Opening device...
    Skipping non-root hub device
  Device: /dev/bus/usb/001/002
    Opening device...
    Skipping non-root hub device
  Device: /dev/bus/usb/001/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd

Iteration 190 complete =E2=80=94 attempted 9 devices
------------------------------------------------
=3D=3D=3D Starting iteration 191 =3D=3D=3D
Processing bus 011
  Device: /dev/bus/usb/011/001
    Opening device...
    Opened fd=3D6
    Issuing USBDEVFS_CONTROL ioctl (GET_DESCRIPTOR)...
    ioctl completed
    Closed fd
Processing bus 010
  Device: /dev/bus/usb/010/001
    Opening device...


The C program used that only tries root hubs, while the system is under load
with "stress-ng --cpu 0":

#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/usbdevice_fs.h>
#include <string.h>
#include <limits.h>
#include <errno.h>
#include <stdarg.h>

static FILE *logfile =3D NULL;

void log_and_sync(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
    fflush(stdout);

    if (logfile) {
        va_list args_copy;
        va_start(args, format);
        va_copy(args_copy, args);
        vfprintf(logfile, format, args_copy);
        va_end(args_copy);
        va_end(args);
        fflush(logfile);
        fsync(fileno(logfile));
    }
}

void enumerate_usb() {
    static int iteration =3D 0;
    int device_count =3D 0;

    log_and_sync("=3D=3D=3D Starting iteration %d =3D=3D=3D\n", iteration +=
 1);

    DIR *usb_dir =3D opendir("/dev/bus/usb");
    if (!usb_dir) {
        log_and_sync("Error: opendir /dev/bus/usb failed: %s\n",
strerror(errno));
        return;
    }

    struct dirent *bus_entry;
    while ((bus_entry =3D readdir(usb_dir)) !=3D NULL) {
        if (bus_entry->d_type !=3D DT_DIR || bus_entry->d_name[0] =3D=3D '.=
')
continue;

        char bus_path[PATH_MAX];
        snprintf(bus_path, sizeof(bus_path), "/dev/bus/usb/%s",
bus_entry->d_name);

        log_and_sync("Processing bus %s\n", bus_entry->d_name);

        DIR *bus_dir =3D opendir(bus_path);
        if (!bus_dir) {
            log_and_sync("  Warning: opendir %s failed: %s\n", bus_path,
strerror(errno));
            continue;
        }

        struct dirent *dev_entry;
        while ((dev_entry =3D readdir(bus_dir)) !=3D NULL) {
            if (dev_entry->d_name[0] =3D=3D '.') continue;

            char dev_path[PATH_MAX];
            snprintf(dev_path, sizeof(dev_path), "%s/%s", bus_path,
dev_entry->d_name);

            log_and_sync("  Device: %s\n", dev_path);
            log_and_sync("    Opening device...\n");

                        // Skip root hubs (usually /001)
                        if (strcmp(dev_entry->d_name, "001") !=3D 0) {
                        log_and_sync("    Skipping non-root hub device\n");
                        continue;
                        }

            int fd =3D open(dev_path, O_RDONLY);
            if (fd < 0) {
                log_and_sync("    Open failed: %s\n", strerror(errno));
                continue;
            }

            log_and_sync("    Opened fd=3D%d\n", fd);

            unsigned char desc[18];
            struct usbdevfs_ctrltransfer ctrl =3D {
                .bRequestType =3D 0x80,
                .bRequest     =3D 6,      // GET_DESCRIPTOR
                .wValue       =3D 1 << 8, // Device descriptor
                .wIndex       =3D 0,
                .wLength      =3D sizeof(desc),
                .data         =3D desc,
                .timeout      =3D 1000
            };

            log_and_sync("    Issuing USBDEVFS_CONTROL ioctl
(GET_DESCRIPTOR)...\n");

            ioctl(fd, USBDEVFS_CONTROL, &ctrl);  // Errors ignored, as in
original

            log_and_sync("    ioctl completed\n");

            close(fd);
            log_and_sync("    Closed fd\n");

            device_count++;
        }
        closedir(bus_dir);
    }
    closedir(usb_dir);

    iteration++;
    log_and_sync("\nIteration %d complete =E2=80=94 attempted %d devices\n"=
, iteration,
device_count);
    log_and_sync("------------------------------------------------\n");
}

int main() {
    logfile =3D fopen("usb_poll6_roothubs.log", "w");
    if (!logfile) {
        perror("Failed to open usb_poll.log for writing (will continue with=
out
file logging)");
    }

    log_and_sync("USB usbfs polling test started (1-second interval)\n");
    log_and_sync("You should now see device paths from all buses.\n");
    log_and_sync("On affected systems, freeze typically occurs within
minutes.\n");
    log_and_sync("Detailed logging with fsync() to 'usb_poll.log' for
post-freeze analysis.\n");
    log_and_sync("If freeze occurs during ioctl, you should see 'Issuing ..=
.'
but not 'ioctl completed' for that device.\n\n");

    while (1) {
        enumerate_usb();
        //usleep(1000000);  // 1 second
                usleep(500000); // 0.5s
    }

    if (logfile) fclose(logfile);
    return 0;
}

Is there anything else that you can suggest to get further diagnosis?

Thank you

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

