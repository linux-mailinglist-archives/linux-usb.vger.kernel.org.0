Return-Path: <linux-usb+bounces-497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5DC7AA874
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 07:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id DD5B8280F77
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 05:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F3C14F8F;
	Fri, 22 Sep 2023 05:40:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EFAEAC8
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 05:40:39 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99968F
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 22:40:37 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0c:5a83:9102:3700:af5:b72c:7c0d:556])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F01766071F1;
	Fri, 22 Sep 2023 06:40:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695361236;
	bh=LLWoXpdbU+YOKaP6Vk2aeJcKhry3iyNBGS/ZL6iAjZw=;
	h=From:To:Cc:Subject:References:In-reply-to:Date:From;
	b=noBy14/pP6ll0zms7D0U9Wt1GfNx2U883BN92s7CX0n/H/0x7f2xcV9lVnkw7yOfw
	 YbOowZtKA+TCTVl/lNxXjE1NUxoy2LgS/+GbKKZg6YgwJLPdXNS5flX3n7EkPhuMZc
	 LXfGPuNIVqW8bjSTzUIv8qm02MAz2IUQVmiQhVh0Voy1hlA9wpCsKwUEc4gLj4fKm1
	 U4T5It4aCKdrZMhaZTxwG9el4bBqO16A2XmHmRYJNrTXK4r4fZYEPEClqqr2jDqOcq
	 X3OzbhtYrsbV+K+GZX/rW4yxWcQB08hBbXg+KyxwU5O26nuAwkKzZBT9SVLgtXzSVZ
	 d8m7B7hih2INg==
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux@roeck-us.net, kernel@collabora.com
Subject: Re: [PATCH] usb: hub: Guard against accesses to uninitialized BOS
 descriptors
References: <20230830100418.1952143-1-ricardo.canuelo@collabora.com>
 <2023083007-vowed-latitude-acef@gregkh> <87cyz4hjzq.fsf@collabora.com>
 <2023083048-armrest-subtype-9b6b@gregkh>
In-reply-to: <2023083048-armrest-subtype-9b6b@gregkh>
Date: Fri, 22 Sep 2023 07:40:32 +0200
Message-ID: <87bkduepf3.fsf@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On mi=C3=A9, ago 30 2023 at 13:12:03, Greg KH <gregkh@linuxfoundation.org> =
wrote:
> As all of these are older than the oldest supported LTS kernel, we
> should be fine in taking it all the way back to 4.14.y then.
>
> I'll queue this up after 6.6-rc1 is out, thanks.

Gentle ping, what's the merge status of this patch? I haven't seen it on
-next yet.

Cheers,
Ricardo

