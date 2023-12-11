Return-Path: <linux-usb+bounces-3952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E3380BED6
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 02:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 683461C20958
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 01:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8613EC2E3;
	Mon, 11 Dec 2023 01:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com header.b="AC1Qq0AG"
X-Original-To: linux-usb@vger.kernel.org
Received: from devnull.tasossah.com (devnull.tasossah.com [IPv6:2001:41d0:1:e60e::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43E9D5
	for <linux-usb@vger.kernel.org>; Sun, 10 Dec 2023 17:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WJFP8ucrB8e+qmOVAuV3IPpX/qe2RLpQ9lCgp4YvOjs=; b=AC1Qq0AGIaXBtBxX/H5l3P8RAQ
	hONWy1bNaQMreek05bnbyj2nnDiF0TFuwYADA8VUqOyrpzU43LS+pKBZ7HSk5Hj6T19KQl+wODvsw
	LWaeLek+QbbHsAR61ukAqIw91SoN5OCRNl5jeTD9daSnMp26y7uYJmJA/mxQTt2GQHFM=;
Received: from [2a02:587:6a03:ec00::d54]
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1rCVOi-006sow-Uz; Mon, 11 Dec 2023 03:47:53 +0200
Message-ID: <635ee884-5783-477f-b170-4034344dc7ef@tasossah.com>
Date: Mon, 11 Dec 2023 03:47:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tasos Sahanidis <tasos@tasossah.com>
Subject: Re: [PATCH] usb-storage: Add quirk for incorrect WP on Kingston DT
 Ultimate 3.0 G3
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
References: <20231207134441.298131-1-tasos@tasossah.com>
 <yq1zfykk3rx.fsf@ca-mkp.ca.oracle.com>
Content-Language: el-GR, en-GB
Autocrypt: addr=tasos@tasossah.com; keydata=
 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
In-Reply-To: <yq1zfykk3rx.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Martin,

> That's very interesting. I received a couple of reports about USB
> devices from other vendors that had a similar problems with WP but I
> always assumed it to be a timing issue.

Your remark got me thinking that since you have gotten more reports
about this issue and it's not a one off, then perhaps I should dig
further to figure out a better solution, instead of simply adding an
UNUSUAL_DEVICE entry (just to get this specific device working since
it's been broken for more than a year).

First, I added a 5 second sleep right at the top of sd_do_mode_sense(),
just to verify that a delay isn't needed after the first SCSI command
has been issued. The device still reported write protect, so that
confirms it is not a timing issue.

Then, I proceeded to call scsi_mode_sense() multiple times inside
sd_do_mode_sense(), one right after the other, and to my surprise that
also did not clear WP.

I then called sd_revalidate_disk() multiple times and noticed that WP
was cleared only after the call to device_add_disk(). That led me to
figure out that this device needs a READ_10 command before WP is
disabled.

The following is enough to get the device to show up without WP:

--- /tmp/linux-6.6.5/drivers/scsi/sd.c	2023-12-08 09:52:25.000000000 +0200
+++ src/linux-6.6.5/drivers/scsi/sd.c	2023-12-11 03:23:22.109604623 +0200
@@ -2772,6 +2772,11 @@
 	}
 
 	if (sdp->use_192_bytes_for_3f) {
+		unsigned char cmd[10] = {READ_10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00};
+		unsigned char readbuf[512];
+		scsi_execute_cmd(sdkp->device, cmd, REQ_OP_DRV_IN, readbuf, sizeof(readbuf),
+		                SD_TIMEOUT, sdkp->max_retries, NULL);
+
 		res = sd_do_mode_sense(sdkp, 0, 0x3F, buffer, 192, &data, NULL);
 	} else {
 		/*


which results in:

[   56.050090] sd 10:0:0:0: [sdb] 61472768 512-byte logical blocks: (31.5 GB/29.3 GiB)
[   56.062517] *** thread awakened
[   56.062532] Command READ_10 (10 bytes)
[   56.062543] bytes: 28 00 00 00 00 00 00 00 01 00
[   56.062555] Bulk Command S 0x43425355 T 0x5 L 512 F 128 Trg 0 LUN 0 CL 10
[   56.062570] xfer 31 bytes
[   56.063137] Status code 0; transferred 31/31
[   56.063152] -- transfer complete
[   56.063159] Bulk command transfer result=0
[   56.063168] xfer 512 bytes, 1 entries
[   56.188566] Status code 0; transferred 512/512
[   56.188586] -- transfer complete
[   56.188594] Bulk data transfer result 0x0
[   56.188602] Attempting to get CSW...
[   56.188609] xfer 13 bytes
[   56.190112] Status code 0; transferred 13/13
[   56.190120] -- transfer complete
[   56.190123] Bulk status result = 0
[   56.190126] Bulk Status S 0x53425355 T 0x5 R 0 Stat 0x0
[   56.190132] scsi cmd done, result=0x0
[   56.190158] *** thread sleeping
[   56.190245] *** thread awakened
[   56.190255] Command MODE_SENSE (6 bytes)
[   56.190265] bytes: 1a 00 3f 00 c0 00
[   56.190276] Bulk Command S 0x43425355 T 0x6 L 192 F 128 Trg 0 LUN 0 CL 6
[   56.190291] xfer 31 bytes
[   56.190733] Status code 0; transferred 31/31
[   56.190745] -- transfer complete
[   56.190752] Bulk command transfer result=0
[   56.190761] xfer 192 bytes, 1 entries
[   56.191741] Status code -121; transferred 44/192
[   56.191748] -- short read transfer
[   56.191750] Bulk data transfer result 0x1
[   56.191753] Attempting to get CSW...
[   56.191756] xfer 13 bytes
[   56.192072] Status code 0; transferred 13/13
[   56.192077] -- transfer complete
[   56.192079] Bulk status result = 0
[   56.192082] Bulk Status S 0x53425355 T 0x6 R 148 Stat 0x0
[   56.192087] scsi cmd done, result=0x0
[   56.192111] *** thread sleeping
[   56.192207] sd 10:0:0:0: [sdb] Write Protect is off
[   56.197229] sd 10:0:0:0: [sdb] Mode Sense: 2b 00 00 08

It is worth noting that Windows 10 (2004) also performs this sequence:

- READ_CAPACITY (10)
- READ_10 (10) LBA: 0, Len: 1
- MODE_SENSE (6) page: 0x3f

I'm not sure how to proceed from here. Since there are other devices
affected, I am not sure this patch with the quirk should be applied. At
the very least though, I'd need to submit a V2 to correct the commit
message and comment.

On the other hand, I'm worried that by adding a READ_10 before every
mode sense, something else might break. If you do believe that adding a
READ_10 is the right way forward, I can try cleaning up the diff above
(with some advice) and submit it properly. Any suggestions are welcome.

--
Tasos

