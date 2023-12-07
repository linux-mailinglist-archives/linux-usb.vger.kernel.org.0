Return-Path: <linux-usb+bounces-3845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A3808730
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 13:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2099A28381F
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA29839AC5;
	Thu,  7 Dec 2023 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TovQn2VB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LJ7diW89"
X-Original-To: linux-usb@vger.kernel.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F39D7F;
	Thu,  7 Dec 2023 04:00:08 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 17FF95C01E0;
	Thu,  7 Dec 2023 07:00:05 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 07 Dec 2023 07:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1701950405; x=1702036805; bh=Wu
	2zzybktVhMaCPsvudI7vnD9pwVML1EXB46b4BtaOU=; b=TovQn2VBjPQZ5kleCE
	C4ehy6qsECb79oDYI8xB85arD4VePJOGMSnwyWFkMy1xix7PgNFNS2VkYyounNND
	AvMT4RbugroL+aqNxdt8FoWELUoDh4+RZMc8MTMSCLSDP0EgsSLRR0OCkBOzQBJy
	0emwWTT/23ko4edstaX9lNrxgQSgzGxWUKrIy8ED/DWAj2XVrHD0hUJ4xFYZBIJ1
	DqlheM0rnu0A4qhnDawm6XIGjPZubAihdtifT//7gxN2dEGpQNeRQ4bFtaZZn003
	k0CPiONO8BSxyDSuNDxhtGjxHK2YXUYfStrJpk7GHaDYGLzBrdWYcS9gB+UzVOee
	cdcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701950405; x=1702036805; bh=Wu2zzybktVhMa
	CPsvudI7vnD9pwVML1EXB46b4BtaOU=; b=LJ7diW89v8CZT5E+dUW4gMBwgxwH8
	NLqjVs9k1UVq8+gqWG0GQ2iEC+LlHtm+ONaZ6MEbZWniMBtfdSCqS93L/raRpzFI
	SRRPtWWnyXBB5z7VRpQT7grL+c4b0T1hJzskdGvVEbX5fWSywe5GKQmIHsfeu4C6
	BKFOTZmtnKA/hcaTVNBFeZ0GIvFin9wfMuuiiUzJ1oZFXTsgHWmF3cZWDDApiI5M
	poum3oKS1NrdvXqd7YpBJpVG2UY7tH4VPMZJvgVUS6N8zNRdADBT3uVcYSv2+Dsf
	Z0D8N7FNUKDpSd6oHv1SaBrArw4AMJX/DxHMV3v1LzPHI+ylXoDlagqLQ==
X-ME-Sender: <xms:xLNxZf0i2zNx1KMD-XZKwn3-9Da1WB370LkMKgO6ZqaVUn6WRZNirg>
    <xme:xLNxZeFP7-RwDdeVXOMMRX1iv2in4ccOSGczkqIvnEwuwoCpS0CCoGLji_tEZtGn7
    dFFScLAGdp9_DpvlWk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekvddgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:xLNxZf6AdTSl-75d08recF5Ucm_iVDvpbFOEi7eWOi0ZU_xUXoiwWw>
    <xmx:xLNxZU2M91r0ghUQDXPbrxpUpVMEmoszHG5mJ-lWAuXivLSEcH3YKw>
    <xmx:xLNxZSGvs3xSJFlcvUvSykAbMF2I0ekHisubJaMudGYuJxYL2d021Q>
    <xmx:xbNxZfPbzw2BE6IaI4PXsONCPfMrSOs7mP8NTIl6Sbqzfmtx5ZxO7g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C4E15B60089; Thu,  7 Dec 2023 07:00:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c1df6dc4-ad3f-41ba-b024-1b432dac7af1@app.fastmail.com>
In-Reply-To: <ZXGzJlv9C3Z9lMeI@kuha.fi.intel.com>
References: <20231206123828.587065-1-arnd@kernel.org>
 <ZXGySCtdsxW4qCel@kuha.fi.intel.com>
 <CAA8EJprV3O24V0+MnPK1OdQZQ_7F2aMfN1Um13eH9ux4J+ucMw@mail.gmail.com>
 <ZXGzJlv9C3Z9lMeI@kuha.fi.intel.com>
Date: Thu, 07 Dec 2023 12:59:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: nb7vpq904m: add CONFIG_OF dependency
Content-Type: text/plain

On Thu, Dec 7, 2023, at 12:57, Heikki Krogerus wrote:
> On Thu, Dec 07, 2023 at 01:55:06PM +0200, Dmitry Baryshkov wrote:

> Okay, so this probable should also be
>
>         select DRM_AUX_BRIDGE if DRM_BRIDGE and OF
>
> No?

I think that fails if CONFIG_OF is disabled and
CONFIG_DRM_AUX_BRIDGE, since drm_aux_bridge_register()
will still be called from a built-in driver in that
case but can't be linked against.

       Arnd

