Return-Path: <linux-usb+bounces-25879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ECAB07812
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 16:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFF00173201
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 14:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2F9258CF2;
	Wed, 16 Jul 2025 14:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pjtQlq8I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1C4190472
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752676185; cv=none; b=DlFZlomXIHjeG3dQfpvKHPAfcQbduIq5SvkC0vX/kruvnjECTqjqeVh0Gaq5dDlqyEgjbLu+kTzMwvsW9Nj0kAsrSCgfyH2USfcZyL7GFZrMEPzoc1XotrtMdtp27nn1uez17Uo89PaJ424EdDq86z3En+9QFq0VqU5FKu9htEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752676185; c=relaxed/simple;
	bh=eKUmlpIGboQT6S5Ovz6KOSqf2T5cj+mftR73RhnZT+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJhjTp86DT6JfdA7mDNpFcjiATgBuWp4rOxPWSsDpdHmiPREU+U+RnTshSdLtPVbP9xXOCaJd3FWWsYvYKaCRdDiAFopq1xpnifQisr6fenDU/CS2v9GwaUTprbDnr78TFCvF56aQ2gEbIUFTFoP+Z6hgqeiVxids38Gihu+8To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pjtQlq8I; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d3f192a64eso647460485a.2
        for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752676181; x=1753280981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qt9z7TyyvFxzc9Zi5QX61Y9RbsiY23u8uaORF/jvc7k=;
        b=pjtQlq8IX8EaOxjjDRdPRgI92utzhFKWca+2epJjYzCqL0ml1OceuruNYv4YPrvlwj
         nr3BlrXUyZFovuHUUIKtEGWsfI0RF9Wm98suBLvLCYZ5X8UrVoemUel8DjqfVdl7GgUS
         qNN3mslKO70h9htLfkMcY+XP9lm4eJbtWoxPyjUPUzILHZF2Q42vRavSxYglC5pilLz/
         TYZgkAE2JqMee654L65PhAebhTI4+aNW1pw/stRveuurM3+JKc860CZ5wYxaegQfyvE1
         tcQkZDC0EgBxFGdcKGnZCLYEIXfSF1XDpsq+JBcGAX9jp1X/DtTAUTVGS9FOLjLGliN6
         Q2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752676181; x=1753280981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qt9z7TyyvFxzc9Zi5QX61Y9RbsiY23u8uaORF/jvc7k=;
        b=TptS159rGznODOE3CK92K9TX5z8DTM8EEr+ffTemxyNIJzmzxy22DUCdD9pcu/qOjO
         Y4yUNkDp8umg471OAHorquMuKMziRkYCjKLr8e7MGDQv6RtrIxjVKmfTZ+01te7SGAL3
         pVdnICEnBTVp2LQ8O+vH4Fc61076v1t/qY2ig/F21GHZpLjfVrYghhN+m0+ZLdTax6G1
         QNrgjlhVNrAZGQMswfX2A9fL8t5aOp3+LQbhSvXhza1YNLhW5FKbvnHHO/E+kwss+AJQ
         DRH/HMb4ezpajONLrOklN0rnXOBcEhHh+WeOw613O23tytb+R9CFMY1CEe8Zs00AGfmX
         dYyA==
X-Forwarded-Encrypted: i=1; AJvYcCWMS1Co5zJUj/OAh+Wis3ZOdOh+JXCrF8eHo1FWoaYO/fibR1v/4G/r1e/G+JX3gq44Nc1XQGm0m2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YypfEVJpfxmoDjFqNCVYJX/vAJeR6s9DT5CdGW25pYybdE83yBH
	KRsVFf1jae+R6s63zFX0h0B57A0/7r2Tx5eEVU3TswPNtNv0UR7jC15v1tRAkDP/jg==
X-Gm-Gg: ASbGncvtIm9dQw8nGke3LDFqkOuiF2OT6+gVYDY27T4bQnCgZbPrPpNRwjYIsztMGQy
	0WCWbhBuL3nw2zrNudQBU3DKo6qpHqo+2fMxQq2hmOGJkZs7IVN46BmLmKe5AXim8R4TpvX+QE4
	fFBuy2skoxmIh729P2EjDpzpkDZOEbmsRLFmg6bSjAcRvJGXdZvLnbBfZYBVzJQXPKETgoYInuY
	VWn+FSmDByRlr2/6Wq6L0BTy24LoxokLymEXmlQ/bPA1/01KiG4T3L5dI8GpOf2bOXKjGMt36qL
	D1/fdfNdqovPtStr5rYK97JElZ1Fhkmc61aAXqiWWHVbFJbwXBlFuVmpJtd95HaQ9dBAQWfdXsx
	1q3gb4X/2qEhjesYOl4NIFOweZP4hHPt8+ER0mGet
X-Google-Smtp-Source: AGHT+IF3xlSqjICIE4by+UPGer4acYrJ4z0g+fjVRC6/rj7+8rf0BJhYUp+VmTOPflFKpHho7TjrBQ==
X-Received: by 2002:ad4:5cec:0:b0:704:7dbd:d991 with SMTP id 6a1803df08f44-704f4a9a406mr57966406d6.31.1752676180409;
        Wed, 16 Jul 2025 07:29:40 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39c9dsm70452096d6.66.2025.07.16.07.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:29:39 -0700 (PDT)
Date: Wed, 16 Jul 2025 10:29:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
Message-ID: <78c3fb66-c30f-4c64-a499-61c1665186a8@rowland.harvard.edu>
References: <8bec1698-5008-428f-8e71-ec002def0c54@rowland.harvard.edu>
 <6876b0ec.a70a0220.693ce.0019.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6876b0ec.a70a0220.693ce.0019.GAE@google.com>

On Tue, Jul 15, 2025 at 12:50:04PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> UBSAN: shift-out-of-bounds in s32ton
> 
> microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
> microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
> hid: s32ton: n 0 val 0 size 0x0
> ------------[ cut here ]------------
> UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
> shift exponent 4294967295 is too large for 32-bit type '__s32' (aka 'int')

Benjamin:

Clearly there's going to be trouble when you try to convert a signed 
32-bit value to a 0-bit number!

My impression is that hid_parser_global() should reject Report Size or 
Report Count items with a value of 0.  Such fields would be meaningless 
in any case.  The routine checks for values that are too large, but not 
for values that are too small.

Does this look like the right approach?

Alan Stern

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git c2ca42f1

 drivers/hid/hid-core.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -464,7 +464,8 @@ static int hid_parser_global(struct hid_
 
 	case HID_GLOBAL_ITEM_TAG_REPORT_SIZE:
 		parser->global.report_size = item_udata(item);
-		if (parser->global.report_size > 256) {
+		if (parser->global.report_size > 256 ||
+				parser->global.report_size == 0) {
 			hid_err(parser->device, "invalid report_size %d\n",
 					parser->global.report_size);
 			return -1;
@@ -473,7 +474,8 @@ static int hid_parser_global(struct hid_
 
 	case HID_GLOBAL_ITEM_TAG_REPORT_COUNT:
 		parser->global.report_count = item_udata(item);
-		if (parser->global.report_count > HID_MAX_USAGES) {
+		if (parser->global.report_count > HID_MAX_USAGES ||
+				parser->global.report_count == 0) {
 			hid_err(parser->device, "invalid report_count %d\n",
 					parser->global.report_count);
 			return -1;


