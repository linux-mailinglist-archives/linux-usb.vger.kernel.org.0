Return-Path: <linux-usb+bounces-11079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D12902938
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 21:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ABBBB2270A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 19:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2CB14D2A4;
	Mon, 10 Jun 2024 19:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzAOVifz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6EE823CD
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718047558; cv=none; b=aRuVQPJYuYnCiy8JEy0wi7Nl81gNjVUI0SH6nfE1uYJ7LawDh0TA8bqgJoLKxtEYT3JqUIhsneK7S/fonZxXz1CgcJxLWFZ3BlHQDA4KuIbT6M+I6DCjgPmMqksBZrsy2nccmz3TuepSazxlnMV9/mBWZOIQ42xPud52t5thLok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718047558; c=relaxed/simple;
	bh=UYdQiRsWw+DxxQ5s+nhwJt/uRbMe+Rqs16+ImWJdqls=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=PF1g3VVkdhOOaP2PhQFF5Jm92bntkSKqdMu7TAwMa2T6K1PicrFcHn9SBBxZzanaZfn+6yTXgsWSpGRaC8+z232cfQrjnmKyAgx83TXxXCZzau3gQ1UgK5QT/jrRR3ganAWj6oCG4gm3F3oaDGQax00nJ/F3PgXk2qH/Ofttx5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzAOVifz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42133f8432aso2305815e9.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718047555; x=1718652355; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t/wFtgkawxmQAvNEZuJS8jIc8Xew0mHLfoWgWBjWq/Y=;
        b=dzAOVifzigS2siXzxi9zBiV3nHW5bTnQffMMfBCMHRilS3amDemDoZ1DjycEfIiEBX
         7M8ZmPKPNZRDP+z5OTfs0YuqXkmDxDcups+8la5KuiMQvqJiPpmiGMm9K5e4MH9HuGWH
         fBD8sK9olDcr2thwKIXjuyWuWBRaSbBtI7XTIJFo5YOX8FrWWPeufAQNdm8/Dkde9bCW
         IQea741ypFPj65mLLHvE3489atxavLrtoZT9IjZs+rG2xyUmkSRDR6xQzZU8EHAH84TB
         P416FKwphdhZb6xV4eSbXw7RfOGeElHNzN8C69hgOFFLZ5HaXPr2/EJgDJoUPb5SG7bR
         5DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718047555; x=1718652355;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/wFtgkawxmQAvNEZuJS8jIc8Xew0mHLfoWgWBjWq/Y=;
        b=cvYs2AWsoaNqdOJqyYwRL3z6GhJwZZ82LRmCAt4TxrxkJYftsjjXL1u9jp9Lql2eI3
         C9ck45lQNEXF0+0k4ysqd91wDdtKtXaryT2jW86ScVD/yGJpiK/sCVdIXz8G1MtYuvfZ
         in2iDeClhFT93hgXcVsSETbQ9cv2AXlQ+6BQqeX7m8b1+a/mFPrsttt0Zm91KpCaRqah
         oX70haP6mS8+UhvpMqY2n0Wy4x/eQ5dI1dolLZBvtBhnb7mYVtjRkQ1a3vZvzdGanv03
         8YApb/TLkx+1PHaiLp6TQs/p9I/LHXYkN5+TRtCsbHDAWYUzo/oHuWBNgRuK1rF1jMNa
         62Mg==
X-Gm-Message-State: AOJu0YxvYbZVLWeQy+stCF0fxFHREauS4AcoVK9AcG4uxb3Xw7i09fA+
	GRbJin2cbaIbgOU7f+RwOss8I3mdntmNh7aV+bk8cL9v/LMDWhx9d15uOw==
X-Google-Smtp-Source: AGHT+IGokevgGyOjrOEi/F5nCTj3uvWTbDXTahZlQeotAtYE350gZiELinqFWXE0ITpI89jeqlAzDA==
X-Received: by 2002:a05:600c:524e:b0:421:5604:d1c4 with SMTP id 5b1f17b1804b1-42164a21e8cmr79242805e9.27.1718047554707;
        Mon, 10 Jun 2024 12:25:54 -0700 (PDT)
Received: from hermes.prahal.homelinux.net (91-175-163-178.subs.proxad.net. [91.175.163.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2a6c9fsm151884575e9.28.2024.06.10.12.25.54
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 12:25:54 -0700 (PDT)
Message-ID: <9791b3eee4fc52b45f1ea9b9724bf977bf5c38d4.camel@gmail.com>
Subject: add NO_REPORT_LUNS quirk for at least a few Seagate external drives
 to fix smartctl with uas
From: Alban Browaeys <alban.browaeys@gmail.com>
To: linux-usb@vger.kernel.org
Date: Mon, 10 Jun 2024 21:25:54 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

I found that for "smartctl" to work on my two Seagate Expansion
external USB3  I had to add the "j" usb-storage quirks ie
"US_FL_NO_REPORT_LUNS".
(They are years apart).



Bus 002 Device 008: ID 0bc2:231a Seagate RSS LLC Expansion Portable
Bus 002 Device 007: ID 0bc2:2037 Seagate RSS LLC Expansion HDD


Could these be added to drivers/usb/storage/unusual_uas.h
with the "US_FL_NO_REPORT_LUNS" quirk, after the existing
"UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999," for the Seagate
"Expansion Desk"?

Or could you send me hacks to fix the REPORT_LUNS support for Seagate?

For now, I use "0bc2:2037:j" and "u,0x0bc2:0x231a:j" in
"/sys/module/usb_storage/parameters/quirks".


I got the idea from:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D1363074667a6b7d0507527742ccd7bbed5e3ceaa
"
USB: uas: Add a new NO_REPORT_LUNS quirk
Add a new NO_REPORT_LUNS quirk and set it for Seagate drives with
an usb-id of: 0bc2:331a, as these will fail to respond to a
REPORT_LUNS command.
"

Discussion on
https://lore.kernel.org/all/1459426971-11927-1-git-send-email-hdegoede@redh=
at.com/
of which=20
https://lore.kernel.org/all/7977162.W24Fksp8b7@ok64/ tells that Seagate
at least back then had issues with REPORT_LUNS but not always: "
> Actually it does support REPORT LUNS, some of the time. When you first
> boot the computer with uas blacklisted for this device, so initialize
> it once with usb-storage, and then reboot with out the blacklist
> (and without removing power to the drive) uas will work with REPORT LUNS
> bit cold-booting directly into uas mode and then doing a REPORT LUNS
> upsets the drive / disk enclosure (this has all been observed by
> David Webb, I do not own such a drive).

Just to confirm what Hans has reported.  After power has been removed the=
=20
Seagate Expansion usb disk always produces faults unless it has been=20
blacklisted in some way.  Once the disk is working the computer can be powe=
red=20
off and restarted without the blacklist and, as long as its power has not b=
een=20
removed, the disk can be reconnected many times without any error.

With Hans's changes the disk mounts correctly with the uas module every tim=
e.

My guess is that one of the interface registers is not or cannot be=20
initialized correctly.  If after a failure I try unplugging and reinserting=
=20
the usb connector many times it has sometimes connected correctly - which t=
o=20
me means that some random bit eventually has the right value.=20

"


Regards,
Alban

