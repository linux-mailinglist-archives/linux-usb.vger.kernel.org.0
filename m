Return-Path: <linux-usb+bounces-449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD07A9CB2
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 21:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7235284E39
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 19:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E43D513B6;
	Thu, 21 Sep 2023 18:34:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A0C513B5
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 18:34:35 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FDCD9D05
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 11:30:36 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3226b8de467so581926f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695321034; x=1695925834; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:subject:message-id:from:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Iu3Arz1gTZWueOzqhKtwdCFEXOrNjH4JN6xgMQxZHeI=;
        b=P+sjfWYfgN+dgjYa5Ux1pKi5t517tv5Rr+N/c1QLfD33W1NfQT/WcuHGZREFDm5ZW6
         8GDwtP9XJSnR97Kuaz6IRbpZMQX56v7d2C6D9546CgTeU9XyMKBY3NgxAqr3xWJWAorY
         0xfhrijSV+bnD5oQfbygxK2A/IVxPqKSWMT0PUPfgqiVkUhimNdOShUogGKb+wz5MnMM
         gepKS4ZphzwofPR9CWwL4OLUUxxWr8qiOFHLc2O43EBg+YMn4NvB8T8QyWzpYNWNFZYM
         TCvRRlz4PrNKP8HvL8hBRD7nkCzpSUO2Bkny549zTsbCaf3NzvtO8eppqsoqGYd+kkAh
         v3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695321034; x=1695925834;
        h=user-agent:mime-version:date:content-transfer-encoding:face
         :references:in-reply-to:cc:to:subject:message-id:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iu3Arz1gTZWueOzqhKtwdCFEXOrNjH4JN6xgMQxZHeI=;
        b=pWZYIRcj72Go2a2MMXkzeBPbJboNbMqhTHr+3QV5tJZGKGcteU7y+LUBs80qlUBxGD
         m3Olq32xbLqvfbBQDkKn7y9/Nqh73xWm+36BncQTOV+0u2Tl85O2+GX6KhNHo3ox8sQ6
         l6LJg2pC/wUlYynvT3iy1FV6GVq9J5H8towP5TySzBmAYPDIg4ZT7yRgcWKe8TAC9DMz
         YEvwDtH07y83pjVJIMuZpKxKHAniZVYf8u6pEX4zK/1K6OIce3JYVWl6JThCmkOO7akg
         dJVczlb+J0mW9dz1snAftWmMCTbxffaMclmhmOP0mExfA14DjA2vNQjd6AG8zesNsVyE
         1S2A==
X-Gm-Message-State: AOJu0YzQH2s8IiuBnlpRZ0tya/5sbqb91wKVBqkR5FWxMxgDxJ8UW965
	UzpZ0fIcRQhArg7M5xNouTouLWlINj0=
X-Google-Smtp-Source: AGHT+IGnK+KAcnUdZXLCQfuKOS3ye8x9EbsSDbNPCWDw1Lhv0CYvBYRP7uhs0Sj+/UVr4x+Hi780NA==
X-Received: by 2002:a7b:ca56:0:b0:402:cf9f:c02d with SMTP id m22-20020a7bca56000000b00402cf9fc02dmr5362449wml.8.1695298936840;
        Thu, 21 Sep 2023 05:22:16 -0700 (PDT)
Received: from mobalindesk.lan.lan (dynamic-077-001-061-125.77.1.pool.telefonica.de. [77.1.61.125])
        by smtp.googlemail.com with ESMTPSA id d18-20020a05600c251200b003fed7fa6c00sm4682682wma.7.2023.09.21.05.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:22:16 -0700 (PDT)
Sender: Massimo B <burcheri.massimo@gmail.com>
From: Massimo Burcheri <massimo@burcheri.de>
X-Google-Original-From: Massimo Burcheri <burcheri.massimo+linux-usb@gmail.com>
Message-ID: <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
Subject: Re: JMicron JMS567 and UAS
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb <linux-usb@vger.kernel.org>
In-Reply-To: <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
	 <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
Face:
 iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Sep 2023 14:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.48.4 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, 2023-09-19 at 11:13 -0400, Alan Stern wrote:

> > coming from https://lore.kernel.org/all/20200818041324.GA3173@Susan/

> > as I understand UAS was working for JMicron JMS567 in the past, then wa=
s
> > disabled in the kernel, now using usb-storage.

> How did you get that idea?=C2=A0 After looking through the email archives=
, I=20
> found this bug report from 2015:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0https://bugzilla.redhat.c=
om/show_bug.cgi?id=3D1260207

I got the idea from my original thread.
I did not test it on old kernel.

> That bug report indicates that the device wasn't working properly with a=
=20
> 4.1.4 kernel.=C2=A0 Of course, it's possible that the problem had more to=
 do=20
> with the drive inside the enclosure than the enclosure itself.

From the report the idProduct is different from my product, might be a diff=
erent
bridge.

So from what I understand it is blacklisted currently because of issues.

Is there a way I can bypass the blacklisting, like forcing to use uas simil=
ar to
the workaround by forcing usb-storage? I would like to know if there are st=
ill
issues in uas mode with this bridge.

The (chinese?) product is sold with UAS support. I know this is no warranty=
. The
JMicron bridge itself should support UASP:
https://pcper.com/wp-content/uploads/2014/12/0813-jms567.pdf

I found someone that fixed it by flashing an older firmware:
https://forum.openmediavault.org/index.php?user-post-list/36559-sanjager/
(Version 20.06.00.01, before 138.01.00.01)

It seems a similar device Icybox 4HDD enclosure is also using the JMS567:
https://answers.launchpad.net/ubuntu/+source/linux/+question/688498

This all sounds like UAS is not entirely missing but somehow faulty in this
bridge.

I'm going to test with a Windows machine soon, if UAS is working stable the=
re.
But that won't help me on Linux, just for saying the enclosure hardware is =
UAS
capable.

How can I help exploring / debugging this?

Best regards,
Massimo

