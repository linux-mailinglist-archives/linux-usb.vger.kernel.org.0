Return-Path: <linux-usb+bounces-7156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A287986A058
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 20:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B56F9B32D24
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 19:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C211487EF;
	Tue, 27 Feb 2024 19:36:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id ECACA4F8B1
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709062595; cv=none; b=mM516ye8sDZybpyLrbEoIY+epD9RancgvYV2infxa6conAOq04iKkRj8QPIpS3GjDVhN0t84XdTEK7li/Fi4WQYz2hjjVKkDxb4hNQptlbCrVX1CwmU7i0GdH+SPj3VMAuud6JWuzBZYBjiLEJo+uTfPAwkrVXkzgmhZfHsxg6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709062595; c=relaxed/simple;
	bh=TpsYGSn+KVgiuE1rnZzfXrhympxdF5n2rMJg+jDI/No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDQoV4jtSqKfbsD6JRKQsRQcp/1gZhaIv8qR4IH0NfBUeHvqjL73Zp6DzV7eANa4H88D/qNoL71VesQMUQyn231DJdRG1vpg+hxyFLFUoCkjUSdKLQcVkqRpY+FQ0O25F7i7N8hrtQ9Fx4mMxGAiWS74JGGu1oB4loGq+zeJ388=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 774067 invoked by uid 1000); 27 Feb 2024 14:36:23 -0500
Date: Tue, 27 Feb 2024 14:36:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+28748250ab47a8f04100@syzkaller.appspotmail.com>
Cc: bvanassche@acm.org, emilne@redhat.com, gregkh@linuxfoundation.org,
  linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
  martin.petersen@oracle.com, syzkaller-bugs@googlegroups.com,
  tasos@tasossah.com, usb-storage@lists.one-eyed-alien.net
Subject: Re: [syzbot] [usb-storage?] divide error in isd200_ata_command
Message-ID: <8fe3f46c-4ee5-4597-bf2d-12a5d634a264@rowland.harvard.edu>
References: <0000000000003eb868061245ba7f@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000003eb868061245ba7f@google.com>

On Mon, Feb 26, 2024 at 01:42:26AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    f2e367d6ad3b Merge tag 'for-6.8/dm-fix-3' of git://git.ker..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=114e10e4180000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=eff9f3183d0a20dd
> dashboard link: https://syzkaller.appspot.com/bug?extid=28748250ab47a8f04100
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1064b372180000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10aca6ac180000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/c55ca1fdc5ad/disk-f2e367d6.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/4556a82fb4ed/vmlinux-f2e367d6.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/95338ed9dad1/bzImage-f2e367d6.xz
> 
> The issue was bisected to:
> 
> commit 321da3dc1f3c92a12e3c5da934090d2992a8814c
> Author: Martin K. Petersen <martin.petersen@oracle.com>
> Date:   Tue Feb 13 14:33:06 2024 +0000
> 
>     scsi: sd: usb_storage: uas: Access media prior to querying device properties
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15a3934a180000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=17a3934a180000
> console output: https://syzkaller.appspot.com/x/log.txt?x=13a3934a180000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+28748250ab47a8f04100@syzkaller.appspotmail.com
> Fixes: 321da3dc1f3c ("scsi: sd: usb_storage: uas: Access media prior to querying device properties")
> 
> divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> CPU: 0 PID: 5070 Comm: usb-storage Not tainted 6.8.0-rc5-syzkaller-00297-gf2e367d6ad3b #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
> RIP: 0010:isd200_scsi_to_ata drivers/usb/storage/isd200.c:1318 [inline]
> RIP: 0010:isd200_ata_command+0x776/0x2380 drivers/usb/storage/isd200.c:1529

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ f2e367d6ad3b

Index: usb-devel/drivers/usb/storage/isd200.c
===================================================================
--- usb-devel.orig/drivers/usb/storage/isd200.c
+++ usb-devel/drivers/usb/storage/isd200.c
@@ -1105,7 +1105,7 @@ static void isd200_dump_driveid(struct u
 static int isd200_get_inquiry_data( struct us_data *us )
 {
 	struct isd200_info *info = (struct isd200_info *)us->extra;
-	int retStatus = ISD200_GOOD;
+	int retStatus;
 	u16 *id = info->id;
 
 	usb_stor_dbg(us, "Entering isd200_get_inquiry_data\n");
@@ -1137,6 +1137,13 @@ static int isd200_get_inquiry_data( stru
 				isd200_fix_driveid(id);
 				isd200_dump_driveid(us, id);
 
+				/* Prevent division by 0 in isd200_scsi_to_ata() */
+				if (id[ATA_ID_HEADS] == 0 || id[ATA_ID_SECTORS] == 0) {
+					usb_stor_dbg(us, "   Invalid ATA Identify data\n");
+					retStatus = ISD200_ERROR;
+					goto Done;
+				}
+
 				memset(&info->InquiryData, 0, sizeof(info->InquiryData));
 
 				/* Standard IDE interface only supports disks */
@@ -1202,6 +1209,7 @@ static int isd200_get_inquiry_data( stru
 		}
 	}
 
+ Done:
 	usb_stor_dbg(us, "Leaving isd200_get_inquiry_data %08X\n", retStatus);
 
 	return(retStatus);
@@ -1481,22 +1489,27 @@ static int isd200_init_info(struct us_da
 
 static int isd200_Initialization(struct us_data *us)
 {
+	int rc = 0;
+
 	usb_stor_dbg(us, "ISD200 Initialization...\n");
 
 	/* Initialize ISD200 info struct */
 
-	if (isd200_init_info(us) == ISD200_ERROR) {
+	if (isd200_init_info(us) < 0) {
 		usb_stor_dbg(us, "ERROR Initializing ISD200 Info struct\n");
+		rc = -ENOMEM;
 	} else {
 		/* Get device specific data */
 
-		if (isd200_get_inquiry_data(us) != ISD200_GOOD)
+		if (isd200_get_inquiry_data(us) != ISD200_GOOD) {
 			usb_stor_dbg(us, "ISD200 Initialization Failure\n");
-		else
+			rc = -EINVAL;
+		} else {
 			usb_stor_dbg(us, "ISD200 Initialization complete\n");
+		}
 	}
 
-	return 0;
+	return rc;
 }
 
 

