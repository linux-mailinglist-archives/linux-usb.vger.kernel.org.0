Return-Path: <linux-usb+bounces-2273-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 825B77D9877
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 14:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464CA282595
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356891EB39;
	Fri, 27 Oct 2023 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRU8bvm8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85CA1EB31
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 12:37:55 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F4F128
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 05:37:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-508126afb9bso2840658e87.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698410272; x=1699015072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oipxMKOoSoi3Wigzjf1iAv/19gMw+I65DE5XifLHvRY=;
        b=mRU8bvm8F0qez749Az48FtJyTwpukzDZb0/PeOCGevH0RYVbGcGS0pScud+B+VCLb4
         ngKe1MTQRHNS9dudyfHsMHlUrVorurja2+QTr21TmVjzSfgT9PcmJ22mSODpwBdrREM+
         vAVn2LX7aBX8vKyCQUZZnrAbkkF3spKeETs2nzoypovqbEH6g0wY6ePc4iXt456SQfZZ
         PNbridOff6BvJmgVqnqEB6KWSwqgaPSX49FOvVV0ChcIwkVLI5QNbvWqC087XNYJOPt4
         RNB5KMukgPaxQ4L1+IW8Jo9xILQTnck3qDEgmGZbZfpGDA5PQ1dOQL15h3j2ODfhUTM8
         EsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698410272; x=1699015072;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oipxMKOoSoi3Wigzjf1iAv/19gMw+I65DE5XifLHvRY=;
        b=LK1FAVJT69Q6MQeNyyzlwd4Pb9EWl+Zrni3hTNWjauqsmhI+/eeTqs6q+wDVFfiSfn
         MysT/uBcHkg+ewXcKpmex2EfbEcRxdwr1H5IqjYTDXFci3AANQ6pWOapqxJQoC5/azkT
         4Mh/lLm58bseabYS3/sM4xwecOOILzALLIm6F5ydnNoQwyWpqZbg+66U0QFJVq5LE9UE
         ak/H2hx6jnivIHrRsuomjGVeqwjewkciOKJ+XROXzDbhGPBdUlKPT9DwZSqqu02H3m58
         5zahsKldFTUj3ry6uba+XU8hRf/XSVFcyFAM9POtNt1nem7YEbNAcK3gtaudiLufbVxA
         VXfQ==
X-Gm-Message-State: AOJu0YzbKX4YWB/wxfHMMn3aqu/P68wVa8vGIcNC6J3JU+/cl95uJuGH
	Jwgrgbxj33/JCUXJ/19sg1T0STyl7zpGMg==
X-Google-Smtp-Source: AGHT+IFcFb1TeH5PYngj1GxxyyFhmPIs1jhvhsq4J+w8Fur/VlwuWVJMBGsF95wrtaGvkyuTuKrwHQ==
X-Received: by 2002:a05:6512:282c:b0:508:2022:7738 with SMTP id cf44-20020a056512282c00b0050820227738mr1734871lfb.19.1698410272261;
        Fri, 27 Oct 2023 05:37:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:4c14:9c00::188? (dltml4yyyyyyyyyyyyhfy-3.rev.dnainternet.fi. [2001:14ba:4c14:9c00::188])
        by smtp.gmail.com with ESMTPSA id q14-20020ac246ee000000b005057fe45833sm261568lfo.227.2023.10.27.05.37.51
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 05:37:52 -0700 (PDT)
Message-ID: <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
Date: Fri, 27 Oct 2023 15:37:51 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] set 1.50 as the lower bcdDevice value for "Super
 Top"-device in drivers/usb/storage/unusual_cypress.h
Content-Language: en-US
To: Linux USB <linux-usb@vger.kernel.org>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
From: LihaSika <lihasika@gmail.com>
In-Reply-To: <2023102704-stable-lid-c86a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> - Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
>    and can not be applied.  Please read the file,
>    Documentation/process/email-clients.rst in order to fix this.
> 

Oh right, Thunderbird wrapped the first line of the patch file -.-

Disabled wrapping, another attempt:

Cc: stable@vger.kernel.org
Signed-off-by: Liha Sikanen <lihasika@gmail.com>
---

diff --git a/drivers/usb/storage/unusual_cypress.h b/drivers/usb/storage/unusual_cypress.h
index 0547daf..7b3d5f0 100644
--- a/drivers/usb/storage/unusual_cypress.h
+++ b/drivers/usb/storage/unusual_cypress.h
@@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
          "Cypress ISD-300LP",
          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),

-UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
+UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
          "Super Top",
          "USB 2.0  SATA BRIDGE",
          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),




