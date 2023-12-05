Return-Path: <linux-usb+bounces-3760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE1805F39
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 21:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464C11F21708
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 20:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884DC6DCFF;
	Tue,  5 Dec 2023 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiWGUWdV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC95C0
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 12:15:30 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d04d286bc0so28522705ad.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Dec 2023 12:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701807330; x=1702412130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHqRAVi4NT5d8GGHyN3TjlOKqkitjv9gbIbEzZ2nogw=;
        b=OiWGUWdVZBWrrdtjvYOYMiO7m/ok7cJnIwibp/T31ExQTRnDGPtaNWJTLY7dJEhfPg
         X4GH6TbB4uTkBF4k274y43mEw4zTkqcn0ZTV0w+4TjhqblazuG5euIJymR6MUVleYjwU
         9frsOE91yLR9GSXr9oBazroWVkxNzAvjUnpk1CMW2sEbpFyj48j72qQvrxTE4CvIowwC
         uRHIdN8b5ILE3tSF0uw1wA/qh1mkhakXqIbw0cTDVbPJvx06y5FsjZrEMFbDbUvTyiMb
         DKJGj0Ecv+ReOLGM7HkWwcfwcQ7LsvTVrAurKj85DkqI2rfV1s8g7zxO7UeP+oStw5po
         NCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701807330; x=1702412130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHqRAVi4NT5d8GGHyN3TjlOKqkitjv9gbIbEzZ2nogw=;
        b=GvEU54ZdNiXJQUWAS2U/no7VU5G8Bz4ObMx5xZy8HbtUAjOBzGofpvmETKBsSEB+1Z
         Wdf7FL8zMXm8z8RRZTBIgyFcnta41DY164dNOJ3/vL1J+6h+vkcAjavy/C7DqA5T0Wqn
         LHxPfJ58bx6IunyDH+Fb+364h8wmAAPLDtxSV0JPE0SaZcPDZu0hCfDwVSkZA9HhArOi
         Pc05ZsUMHPDUDYkFDUNOg8f9dPZAsQGm5nm/u+iiuYTkGBgDDoHI5U/RdaL+FtYj4zT6
         KMwAR+fdjbmHBH2IZJemHirkQxy7eTpMcCTUc1ckZYvDMeAVc7N98rnxPHBCbeTttYN2
         9UcQ==
X-Gm-Message-State: AOJu0YzhbEeF/ve7KRGP0vpbSxlEXeovO5aL8L7LZDfA6/2brt+ANV6N
	5zwMWRCMbN9GIn/UDiWLitY=
X-Google-Smtp-Source: AGHT+IGuFeOaxGW+Yn05NIoXP33te4kzw+PAvspUPbYEu2Tzq/tcjNYJscWTUgUwkYII4OdvKaPQWA==
X-Received: by 2002:a17:902:d4ce:b0:1d0:c532:84ce with SMTP id o14-20020a170902d4ce00b001d0c53284cemr1417618plg.77.1701807330171;
        Tue, 05 Dec 2023 12:15:30 -0800 (PST)
Received: from hdebian.corp.toradex.com ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id j20-20020a170902759400b001c74df14e6fsm10585983pll.284.2023.12.05.12.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 12:15:29 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: oneukum@suse.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	hiago.franco@toradex.com,
	hiagofranco@gmail.com,
	kuba@kernel.org,
	linux-usb@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: Question regarding CDC NCM and VNC performance issue
Date: Tue,  5 Dec 2023 17:14:53 -0300
Message-ID: <20231205201453.71764-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <a13fc273-20ee-4027-9508-7e8e93a9cd29@suse.com>
References: <a13fc273-20ee-4027-9508-7e8e93a9cd29@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Hi Oliver,

Following up on your initial email, I found that adjusting the NTB size
successfully resolved the problem on both Linux and Windows. The VNC
client is now operating with speed and stability after dividing the
package size by 8.

I know that altering the NTB size is not the correct solution, please
consider the attached patch as an explanation, but the assumption that the
issue may be related to an accumulation of small packages, causing delays
in fulfilling the 16KB requirement, seems related.

It appears that the proper fix involves the `hrtimer_start` function on
line 1084 of `f_ncm.c`. However, I'm not sure what I could do to fix it.

Thanks and regards,
Hiago.

 drivers/usb/gadget/function/f_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index cc0ed29a4adc..138982da794a 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -88,8 +88,8 @@ static inline struct f_ncm *func_to_ncm(struct usb_function *f)
  * If the host can group frames, allow it to do that, 16K is selected,
  * because it's used by default by the current linux host driver
  */
-#define NTB_DEFAULT_IN_SIZE	16384
-#define NTB_OUT_SIZE		16384
+#define NTB_DEFAULT_IN_SIZE	2048
+#define NTB_OUT_SIZE		2048
 
 /* Allocation for storing the NDP, 32 should suffice for a
  * 16k packet. This allows a maximum of 32 * 507 Byte packets to
-- 
2.42.0


