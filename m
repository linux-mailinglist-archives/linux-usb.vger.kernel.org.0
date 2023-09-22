Return-Path: <linux-usb+bounces-507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD0C7AAE57
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 11:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 3E5DC282914
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 09:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73C61E503;
	Fri, 22 Sep 2023 09:38:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F11DDEB
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 09:38:54 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F72C196
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 02:38:53 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0c:5a83:9102:3700:af5:b72c:7c0d:556])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CB36D66071C9;
	Fri, 22 Sep 2023 10:38:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695375532;
	bh=HZpWLaqfJIc6HDfKKjEAO5lKBGfsupeUYYeSnrBL21c=;
	h=From:To:Cc:Subject:References:In-reply-to:Date:From;
	b=krAOLI/pcNn+G0bJm2a08vyNRWuPD8QD/CwK8OZ5WTIseeMOBmXKaFModvlhJ0Q1F
	 olYMDqhlFiTmQrQPF4IdWUwOzkeLHjnC96D0D2bzZT5ZaCaVxS1ckKHcW4PLm97iEz
	 OgingaokWit2mtZK07ThJaNISUy6D6OyQAv7+oyf4YjkB+tAi4kAwUv7bXomvyXre9
	 NHxEPbtWq7y/obDbfSsNtd1XQHzyLFKFWPysSApaJzk4GqKhY8ZRPX40SK4/lWq6RU
	 aH5RFVyWaWQdQbVvZ8HIpyUGo3lPhpRTwkijomsH/dIBuBr1hiPnfNIvyMzOg0ufam
	 8zMfnJuQoVrVQ==
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux@roeck-us.net, kernel@collabora.com
Subject: Re: [PATCH] usb: hub: Guard against accesses to uninitialized BOS
 descriptors
References: <20230830100418.1952143-1-ricardo.canuelo@collabora.com>
 <2023083007-vowed-latitude-acef@gregkh> <87cyz4hjzq.fsf@collabora.com>
 <2023083048-armrest-subtype-9b6b@gregkh> <87bkduepf3.fsf@collabora.com>
 <2023092229-fall-transform-4664@gregkh>
In-reply-to: <2023092229-fall-transform-4664@gregkh>
Date: Fri, 22 Sep 2023 11:38:48 +0200
Message-ID: <878r8yeedz.fsf@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Greg,

On vie, sep 22 2023 at 11:12:31, Greg KH <gregkh@linuxfoundation.org> wrote:
> Please relax, it was the merge window and then I have been traveling for
> conferences.  If you wish to have patches applied sooner, please help
> out in reviewing the other outstanding patches on the mailing list to
> provide help to reduce the overall load.

Thanks, and apologies if I sounded pushy, I'm simply going through
patches and trying to stay up to date with their status, no hurry. I
appreciate your effort.

Cheers,
Ricardo

