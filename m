Return-Path: <linux-usb+bounces-26119-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99285B0F57C
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 16:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57189189ED6D
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 14:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1352EF297;
	Wed, 23 Jul 2025 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="VGS2sUEg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1062BE057
	for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281431; cv=none; b=tzV2E+/2Jt9arHN6UCHOn31jF2XYDliQyHqX79KqMdj327Um1i297jgdwizhejmCgRjHH/p1gh1gExUIcmyD8HDq7wkqLbY3TwqvKzl4HHYjSbktJfZDxgDTbH/FpLRvMKjZVyg29GEe5pdeyNNZN6EnqS3LIUAM71ktLym5sRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281431; c=relaxed/simple;
	bh=JINLRyPK/XHmrHdv5rDsHCIk80ombuFWRRr1ZoxYlKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aci6nw6m7oa+otpwk+5LEPNYg7IDCQq4oW3Lk+Mr1QMVe4h0ik8YklqN6cgH+pFVULp8XbzhHfGy4YtkfCQCGyPjx0lo1Rt6jOdgjtmG/xVqJ5R5owoV4Jq+VsLJHHntuJCwjNDXGf9hHmjgAv3gqc0Ux+tGOOI0SXEoCLer4Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=VGS2sUEg; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e050bd078cso611427485a.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753281426; x=1753886226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6+NdY+dse4TRuCBRLvjHpYzB0jjBdQMknOml7h01sQ=;
        b=VGS2sUEgbNhNkn7CS8v1qyxeuBHvK4okW60e18sKkxSaSEwPBGNrmwKjTYbvkhBi0l
         Ubp0Fu5R3BmD0gKwo4nNt20aRPR+cTE/KheDV2J/QMiSqJp0WeL0HFPDLsnRmHKyu4zk
         6Fchy+Z1Cju2p7hQ+ytdMrgCVRUhq6GlKKi/+BpWolwQI6hazGD4Z2e8vIDNDjJQOHXO
         ufcaG5TJIYZ2XgGCl/Frg7fmCfE5Yrc1VyfbKvAQSfjx+UZRfMdrE35evw0TItCEtfu4
         2qxrVZ+ZDeFawfl3eYVEMrLyzm3HflQ085J0p6M5AuOLwB19wBheKBv8KiA6IsaknpB0
         8i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753281426; x=1753886226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6+NdY+dse4TRuCBRLvjHpYzB0jjBdQMknOml7h01sQ=;
        b=fuz8oT5EZE4nhwWzQrj5EoEoiRKjP+YF5rDUm3A27iQRaZG4KKixkez7G3duiuQ7AG
         FvixugyUdENmB9DVpS4LbDHqboVgcHo5JBOcbbDyZ2Q8ynypm1XumW4Aq3NZpq47UlyO
         a7Z01PYyOaWQP6REnt6z/h1die4nYMnMC0qCXxKdBR6ZXgQGxW2fdH98ynUQtNzVwxsp
         ESO27s2s1rfdDOcC6TUCF44tvd3a4xHPgw6WQRWMgfxkLvz5eTAmcIRxmVUh/2lXJvml
         COREHaxReaBFMojYhVAyUZIQyoq4RhB6rH7pY3jX9pGuQNpaeb0ISCP37e4yeZBdKh+e
         axVA==
X-Forwarded-Encrypted: i=1; AJvYcCUNmtPmRiTnEk5sLuMQWjcgDw4SFBpyNy1xBsxo2ymtP9HQoXHqOrC+wiHroRqp+c8X4kn0IetOAzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwvjmUR1qDtq9jTOTRIKqtL4HnwDGrjnI2zsHhCdxou4oT2Ef
	j2jnabf5Sxa/qR/ScjNdRdPZPbqu1fmJIQAB+cl5IRC5DZAUV9ECVnHU05RA06wVvQ==
X-Gm-Gg: ASbGnctloNmQfOts9pEaLE3dmkUkJTXzUSLug8KMgEI+PvoCyczke3rjqhB3wwsGXqw
	2PAOsAqX8D9LrpxnlSZOmGdjDwbLHlSpdrmEcqL/EWlEHAkR0b0QsslG4dd/RdIwvMsaSkG/N74
	N9xTULC27gCcMnh2fzR9dJQS3PdN2B/VeSxXF//zgYakg+tLtY4ov7MPWaiEXmNZe9c1/6CrkzY
	0/+o/JezG1jKHfnE9oEr9eUksc/t9kPkWRlIoJ7hkF7RZIlQEM2pyZ5aFFhrVs/BD4NGc/3roAU
	1+MlDp5bz9YKwBA3W0P4L+r4jyLc2Lj9+iZrd7mVnjTyQG3i6WCj9rdUZ7cjGKpdD3fJLrCdMRX
	Xe0S5MOzXLYG/dTUFlr180h6bzypTAKe5E2tmOshQ
X-Google-Smtp-Source: AGHT+IEH8lLGr/T7Yq7vTVpJCS2wP5k4x++B7KfiVNTmkEItDKQVy+YxIS63SuQn6coDEo1k8yA28w==
X-Received: by 2002:a05:620a:2688:b0:7e6:2de8:7c1 with SMTP id af79cd13be357-7e62de8091bmr156750685a.50.1753281426179;
        Wed, 23 Jul 2025 07:37:06 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356b28f02sm657735785a.12.2025.07.23.07.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:37:05 -0700 (PDT)
Date: Wed, 23 Jul 2025 10:37:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>,
	jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] HID: core: Harden s32ton() against conversion to 0 bits
Message-ID: <613a66cd-4309-4bce-a4f7-2905f9bce0c9@rowland.harvard.edu>
References: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
 <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
 <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>
 <a2c3537a-8ddc-467f-a9f4-b4d413914914@rowland.harvard.edu>
 <voiysrjm3okjtaz7axqupr2jk5yyvxsqgagbwrsey4z24g6rf4@xb75ss3bwol5>
 <bd033800-53f0-4d5a-a52b-b0e01ac48c12@rowland.harvard.edu>
 <34ks6futbrmunsq2tbz75jwqg64lpk4pg6udbbk3yo2exm657b@3fivbjjdcyl4>
 <750377a5-b5df-4b2b-8e38-0001bfbeb30f@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <750377a5-b5df-4b2b-8e38-0001bfbeb30f@rowland.harvard.edu>

Testing by the syzbot fuzzer showed that the HID core gets a
shift-out-of-bounds exception when it tries to convert a 32-bit
quantity to a 0-bit quantity.  Ideally this should never occur, but
there are buggy devices and some might have a report field with size
set to zero; we shouldn't reject the report or the device just because
of that.

Instead, harden the s32ton() routine so that it returns a reasonable
result instead of crashing when it is called with the number of bits
set to 0 -- the same as what snto32() does.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/68753a08.050a0220.33d347.0008.GAE@google.com/
Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Fixes: dde5845a529f ("[PATCH] Generic HID layer - code split")
Cc: stable@vger.kernel.org

---

The commit listed in the Fixes tag is not really the right one.  But
code motion made tracking it back any further more difficult than I
wanted to deal with, so I stopped there.  That commit is from 2006,
which is already far enough in the past.

 drivers/hid/hid-core.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -66,8 +66,12 @@ static s32 snto32(__u32 value, unsigned
 
 static u32 s32ton(__s32 value, unsigned int n)
 {
-	s32 a = value >> (n - 1);
+	s32 a;
 
+	if (!value || !n)
+		return 0;
+
+	a = value >> (n - 1);
 	if (a && a != -1)
 		return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
 	return value & ((1 << n) - 1);

