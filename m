Return-Path: <linux-usb+bounces-2165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 139C07D66A0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 11:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B5C91C20DAE
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 09:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F99210EB;
	Wed, 25 Oct 2023 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="MJLhkMv8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZuSZkpCZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E12D60E;
	Wed, 25 Oct 2023 09:20:52 +0000 (UTC)
X-Greylist: delayed 550 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 Oct 2023 02:20:50 PDT
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF64612D;
	Wed, 25 Oct 2023 02:20:50 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 9B63C580895;
	Wed, 25 Oct 2023 05:11:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 25 Oct 2023 05:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1698225099; x=1698232299; bh=XQ
	yjPYrEkXqH9LFr9i7Krss0TBJ238tCuNu12brYHqk=; b=MJLhkMv8wHH1uRap99
	6aZOrUpOV7AuyTq/+g3mcg88+hYHWdYNXUFcbARaZnP1FV42vzjET4AbY7lQgoQ2
	kacbzQP0ngqnJcuCmZmCXE0OdAiOiNu1T7vcxV+la4m13uUYHlZl+yWkv+dL6sk9
	SZRB4A1hAizlvZagV8BpkbJGp0qFp3N83cZW5ClgZvP8Xy3RbJ6CJwCqtuo5zRfA
	l837MVd53lqiaX6zbksP/NIrooJFVE0UwbnD3wSiXWQOH9Y+axId7wgafuWnG5qQ
	Q+C37twK1Wh0CLo+KvAs9gq+ctXXtRY5FM9geNzgn3mP0TYnDPPgkp2ubBGtxxU9
	WlbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698225099; x=1698232299; bh=XQyjPYrEkXqH9
	LFr9i7Krss0TBJ238tCuNu12brYHqk=; b=ZuSZkpCZhnuTFuOI6EKIEQlzEDUu0
	QvKu0RjGz5cNi+JMA8UUX5L38ctCHNj5k5sX/ywSX+uHspKgwvamwrKFm+bbBsnF
	FI+vLYB4iDuuRbCbf8odj/xZwI5roqwxQuG/QO8b4lMfL81lt80mZOWl2nmyCNbW
	dlwsbVUPNeu5T1nOLTTzbNlGq0qOS2cF79PitsrZdJPJ0LhljPE0CO1c9esj3ync
	j5iPzqxc5xmBLlW4+4uEgRI2fW0utjVQZt0djFel5lPzUaf/gBqvV0QzmgdROFi3
	7uXR+JuPuJiDYzo5H0Mzy3GvvqQhADegASWoVFBZjI1aryq2b6wq420YQ==
X-ME-Sender: <xms:y9s4ZczjNt79yPzuyfqpjNnHPiQZQy8HfOkzjmvoHuYC6Q92WJsTdQ>
    <xme:y9s4ZQRiDh7M9KknP7UGRuMtzBfGfCPv2oH6IvaZmuhFznuzirWhgXgOiCf_mh4iL
    zztUBf1zqAZaA>
X-ME-Received: <xmr:y9s4ZeWrP4PXS6ozxQIDIPoLSFcMD8qL4aVTiAy77m3q3QXYq-OYbol03MTD763H0xWRuAiGMkTZgEBuku4pXdhriiGMktD5CjfesKwpOj4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledtgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegheeuhe
    fgtdeluddtleekfeegjeetgeeikeehfeduieffvddufeefleevtddtvdenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:y9s4Zahai2iiwN2FQkh7El-vr2BPXNUcFh_MoP6uS0ykmyui5uPI6A>
    <xmx:y9s4ZeBN7DUJxb2mjZgxOzWVu71bcv2NG5WdYgfSwAyYuJ8oMr2t0w>
    <xmx:y9s4ZbIE-85TAQQTZacLoUk0h7gyU4XjtGA_Hb_SXvBAJ34j4HQFMw>
    <xmx:y9s4ZZUh-AuiW3Rd_b0s4My5Gdze_jZZ2Zq6ErAdHIbMtnj5pTJjXw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Oct 2023 05:11:38 -0400 (EDT)
Date: Wed, 25 Oct 2023 11:11:36 +0200
From: Greg KH <greg@kroah.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Johan Jonker <jbx6244@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] dt-bindings: usb: rockchip,dwc3: fix reference to
 nonexistent file
Message-ID: <2023102521-glamorous-treat-9870@gregkh>
References: <20231022185150.919293-1-vegard.nossum@oracle.com>
 <6ea02e5e-bc95-48b5-d6e3-15338ebd0a4d@gmail.com>
 <20231024200212.GA465811-robh@kernel.org>
 <abbb7656-86b1-4d77-986e-bfd5dd20ec22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abbb7656-86b1-4d77-986e-bfd5dd20ec22@linaro.org>

On Wed, Oct 25, 2023 at 10:21:54AM +0200, Krzysztof Kozlowski wrote:
> On 24/10/2023 22:02, Rob Herring wrote:
> > On Sun, Oct 22, 2023 at 10:44:10PM +0200, Johan Jonker wrote:
> >>
> >>
> >> On 10/22/23 20:51, Vegard Nossum wrote:
> >>> This file was renamed but left a dangling reference. Fix it.
> >>>
> >>> Fixes: 0f48b0ed356d ("dt-bindings: phy: rename phy-rockchip-inno-usb2.yaml")
> >>
> >>> Cc: Johan Jonker <jbx6244@gmail.com>
> >>
> >> [PATCH v1] dt-bindings: usb: rockchip,dwc3: update inno usb2 phy binding name
> >> https://lore.kernel.org/linux-rockchip/f8747552-d23b-c4cd-cb17-5033fb7f8eb6@gmail.com/
> >>
> >> Already Acked.
> > 
> > I was assuming Greg would pick that up. I've applied the linked patch 
> 
> Would be easier for Greg to pick this up, if he was Cc-ed in original
> patch. His name is the first one listed in output of get_maintainers.pl,
> but hey, what do I know...

Yeah, that's why I missed it.

