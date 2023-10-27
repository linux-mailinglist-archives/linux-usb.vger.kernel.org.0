Return-Path: <linux-usb+bounces-2280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895A07D9946
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 15:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C31901C21041
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 13:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D57F1A596;
	Fri, 27 Oct 2023 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cD0sCk74"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB276179B2
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 13:06:22 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D33EC2
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 06:06:21 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so2859210e87.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698411980; x=1699016780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:to:from:content-language
         :references:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dywRwZ+TKZQt01rEnf/C5Z3+rh5lQmIrjdz8lRd/qXg=;
        b=cD0sCk74MI3zhaaW75vPrHMobr14xTSj/Lk+UTCe4Ap7Y43sAREgBOBVABN/YIelTC
         fyB/+THXmQIi5ytOGMFlp8E34dUAKfp0aeJYojTUURKtNTfDdIK6tZGr7tWNfwgFWIQN
         l14oUKXU1z1qHYYqPNSHnCMrZPtrWi2/jPfGH9ufYr05nqWZdzIROZ4IADa2v+J9GcxT
         DnCImyUVcLRIOB34HMfsEw5E12ZcheNAleKsUOVEsh51czveMqSHzQavjChzRk3oydBH
         0S2EoZtmejAyzvSDGdcas3RB3yhYNvjLXtzBG647yg3639HjrKnWAKP/8fPT23HTSFY1
         lG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698411980; x=1699016780;
        h=content-transfer-encoding:in-reply-to:to:from:content-language
         :references:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dywRwZ+TKZQt01rEnf/C5Z3+rh5lQmIrjdz8lRd/qXg=;
        b=MWL7n1Fax9ZDM11jmrsnhu8ocb9Thzt3H7Ntw8y0HSh5nik+KOjTJI/WVLepkMJ+iv
         wX2lgI2n1siG5GYrokIJgotuh1a5tGhDnAmgj+u9AUCIQJ/m1Vk55yBaWt/Dnas//LcX
         vCbjcOVDZSHJGDRchF9Jx0neDpUZkCt52iYquGFIHbWIoUPkxyOH4jdw9DaE0+DIeLMv
         0p34Wy2jiiiRQbwU17HPXJFqbH1+MrB905n0sejU5oaZ+HO6/HHvzre6eTRjbFLC+zgv
         o+F0sz7ALbJBEY1Ds7giFiFMhekQcoDW/oSMFJxZ6IOzvkPHf9id4WTrrX29CAyoz00s
         4HzA==
X-Gm-Message-State: AOJu0YxLqo5+LILsrMzZDfH+St/epZTirVxmzBDb0l8BsmvNjwz6KNQF
	XqE/v9sO+mq4j4NIAN5nTsOERXeEgkLZeQ==
X-Google-Smtp-Source: AGHT+IFC/sV+9TCD++md1kjhECyYxR6+y1pvrLIwoAF2BOXSBvaoZXNA4HtwzFF8vNwL78LOU4hCsA==
X-Received: by 2002:ac2:4218:0:b0:503:385c:4319 with SMTP id y24-20020ac24218000000b00503385c4319mr1765924lfh.19.1698411979528;
        Fri, 27 Oct 2023 06:06:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:4c14:9c00::188? (dltml4yyyyyyyyyyyyhfy-3.rev.dnainternet.fi. [2001:14ba:4c14:9c00::188])
        by smtp.gmail.com with ESMTPSA id k19-20020ac24573000000b00507a2a4e615sm269121lfm.201.2023.10.27.06.06.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 06:06:19 -0700 (PDT)
Message-ID: <037e5af2-3afd-4a37-a4d7-6dc87af605c7@gmail.com>
Date: Fri, 27 Oct 2023 16:06:18 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] usb: storage: set 1.50 as the lower bcdDevice compatibility
 for older "Super Top"-device to work
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
 <2023102729-spent-ninja-7e39@gregkh>
Content-Language: en-US
From: LihaSika <lihasika@gmail.com>
To: Linux USB <linux-usb@vger.kernel.org>
In-Reply-To: <2023102729-spent-ninja-7e39@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.10.2023 15.46, Greg KH wrote:
> Sorry, still needs a valid changelog and subject line.  read all the
> errors that my patch-bot sent you.
> 
> thanks,
> 
> greg k-h

OK, how about this:

changelog: Change lower bcdDevice value for "Super Top USB 2.0  SATA BRIDGE" to match 1.50. I have such an older device with bcdDevice=1.50 and it will not work otherwise.

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




