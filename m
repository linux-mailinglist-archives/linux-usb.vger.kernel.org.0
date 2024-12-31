Return-Path: <linux-usb+bounces-18930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A41CC9FF182
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 20:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64DFE16262C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 19:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817091AF0B6;
	Tue, 31 Dec 2024 19:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fUjzPtHb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18743188734
	for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735673000; cv=none; b=JHzGc953uq1u0OI8L+LJMbtbd7JMev8I8Jd5GPrx+1admq2am09vJozGdokyayh1JMNSmWpvI1Q/qxihG2nvVLIMuiRXDC3AK3JPN/ykmAA3kSAQwoEKWiYkPOJKs/00UHMlJfc/4+0cd4L3UvEX+mI+hlkox3a5F5BOLlBJVYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735673000; c=relaxed/simple;
	bh=rsOxmJpdatCthUGLimpEWcrq1+9OzR2oFFsh8TVgFNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mB4bZdgVWMpe+TL+ovEgvekaD+JAQN/rplZhW/tqf72KgLgi+753rlokRhj9YsK43nS7JQKd3jN+Knn/gf1MN2PtKzLyKzkkVaDs+jjaSZDzeIMxMAOEyYcNijWBG9ikI6rk4S9d+EI8iTiyFLd//uDCY3ERVQldvc4AK3RHMZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fUjzPtHb; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8f916b40bso136525036d6.3
        for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 11:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1735672996; x=1736277796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OVtWwkvClnJLuthMxoLYyXn9zqoBPZ6choexSddj33c=;
        b=fUjzPtHb9VxYiLaEaZ+xM1LD8Dc4rm+i5zWY9EWgh2F+cSfnz7lIrlWnbg0k+ywjwl
         chADiKgyL+b8BASNgOb0K6Fn7Hu5AIPzaQK9ffBQ5tCTHpXZEfkM/G7VN7m9WPG81bMx
         9wi4fpI6Cp3/tTm87vXR8JDhWQQEVGSJY+pWUCmWSR1Mf2ajJWI/nUaj0YwILAyadX2M
         lXYFv39MoousHSdOIp5uHxFspnVd0VryrYyhQ5sDr459eCOwcHI9s2XB2UYJsQzbxN2Z
         jzBfYcOzbAmCQNsGTZLnEKg27TTfI7ldhE81qLBT8mGqfoaxBEmvtHvd/sCX+peh6YaD
         vvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735672996; x=1736277796;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVtWwkvClnJLuthMxoLYyXn9zqoBPZ6choexSddj33c=;
        b=ulCyT3EeQgAXULECJIU9x6iKKEBx4hjb5frkCXRRn4B2xKvy943IaWnl5Ayh/rZMJ3
         bCqB3TDbUGMYTmJdcOGD+sp3N7tRabVz2AqtyogppLC3bWp56PiW2mrmL2onlFtlNtL1
         l4JtyJJWYYuhkHNzi91WrdKUaaQt60nTD25CoQlK3HfnO1Fm6p4V0+mDYCo/YXNBwsTp
         Wiy7upO7Ah89T4GbTIGEQwuDe2u/eAU2sYyk38+zKnjKVvl3MyEB9WncpV4aBA7H+byB
         fkEk0+vlXDK/5801oeHNiB/t+niMuGxH+Bb1+khg34XT6Oqr5zzxdggZlVcCDQu41Jwf
         EGuA==
X-Forwarded-Encrypted: i=1; AJvYcCVGKmL2uw6i2VjS9Rxkp2o9Hzt+NojrdoyzNNZIGi5QeHoCkVlv51gpz2jOhXNBBIyouR1mvMJspnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1N2Xrz9o6qKUGR0X2HU/0v+ZfiJz7PxDEw/yF7fjXfPc8LPeR
	d02KKzRQJy5WNDEptl4mPpw9OmrtJlptWp+swnWORqRz4I5QQh9rICgjv4FuYw==
X-Gm-Gg: ASbGncusKfw9vpz69gMYB7mfTZV2OsGikP9l/tQlFSwas0Il4VYQXhiSsd2sNVIK1HE
	+r+I1ZH7LzeYEzQP/bR1xGwZ+7dN8wL4n0kpHFcoXbiw46QLtx1jXrbFncB3yOT/lzCfHRMLTsN
	LZPZs97sHRwcLGP3NPZr4Y544UfVNwlKE8v1WLNP1YAaY+U5cAPWr/5Tl3H4boY2r0l+ca2t7CF
	+qIpzggsRZyqwcXPb2Qn3olzr7Plu1IOoWb2cpHBPDLuhGLg/WxdMPhMA==
X-Google-Smtp-Source: AGHT+IHgRXHGRDnfjjLWpHmhj/S7J5dFTRI2Keph+F5H7Gn5xqU0fF6cjKr5iJ2MNMuhU+ba4S0PSA==
X-Received: by 2002:a05:6214:2a82:b0:6d8:aba8:8393 with SMTP id 6a1803df08f44-6dd233a2b38mr699727346d6.44.1735672996001;
        Tue, 31 Dec 2024 11:23:16 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5653])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd598e8f26sm60654536d6.119.2024.12.31.11.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:23:15 -0800 (PST)
Date: Tue, 31 Dec 2024 14:23:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>,
	syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] HID: core: Fix assumption that Resolution Multipliers must
 be in Logical Collections
Message-ID: <18b853f8-9da5-4a28-a845-111d42299478@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42fb8b1d-16bc-4948-a214-2892405db258@rowland.harvard.edu>

A report in 2019 by the syzbot fuzzer was found to be connected to two
errors in the HID core associated with Resolution Multipliers.  One of
the errors was fixed by commit ea427a222d8b ("HID: core: Fix deadloop
in hid_apply_multiplier."), but the other has not been fixed.

This error arises because hid_apply_multipler() assumes that every
Resolution Multiplier control is contained in a Logical Collection,
i.e., there's no way the routine can ever set multiplier_collection to
NULL.  This is in spite of the fact that the function starts with a
big comment saying:

	 * "The Resolution Multiplier control must be contained in the same
	 * Logical Collection as the control(s) to which it is to be applied.
	   ...
	 *  If no Logical Collection is
	 * defined, the Resolution Multiplier is associated with all
	 * controls in the report."
	 * HID Usage Table, v1.12, Section 4.3.1, p30
	 *
	 * Thus, search from the current collection upwards until we find a
	 * logical collection...

The comment and the code overlook the possibility that none of the
collections found may be a Logical Collection.

The fix is to set the multiplier_collection pointer to NULL if the
collection found isn't a Logical Collection.

Reported-by: syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000109c040597dc5843@google.com/
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Cc: Peter Hutterer <peter.hutterer@who-t.net>
Fixes: 5a4abb36f312 ("HID: core: process the Resolution Multiplier")
Cc: stable@vger.kernel.org

---

 drivers/hid/hid-core.c |    2 ++
 1 file changed, 2 insertions(+)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -1163,6 +1163,8 @@ static void hid_apply_multiplier(struct
 	while (multiplier_collection->parent_idx != -1 &&
 	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
 		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
+	if (multiplier_collection->type != HID_COLLECTION_LOGICAL)
+		multiplier_collection = NULL;
 
 	effective_multiplier = hid_calculate_multiplier(hid, multiplier);
 

