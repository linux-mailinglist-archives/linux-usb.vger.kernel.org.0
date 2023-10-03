Return-Path: <linux-usb+bounces-1005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521327B653C
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 015A3281668
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D22DF4E;
	Tue,  3 Oct 2023 09:15:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB5DDAC
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:15:49 +0000 (UTC)
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EA1B3
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1696324542; x=1696583742;
	bh=nen70pPfYsFQ+/UgrSVi4kwZXiA3ZJJ5IdOzvntgq2Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WuPyHewUmOZtWm/VDzREBchcdW8oW4JlA35XXoglek6TeI4z5d3mQZrxyO+a404yc
	 NtnygGO4bukAEK/La5SfEncEt1MlfEFlqBE+7spGznfTNxzPLNO7Q9/pgOu/fV5Nkr
	 tjwoWt+8oW9h2MIkPh6MXaTHLvc4z1sWROoUFjqFMYpAPDpFIY/s6EM3tZ7V8fNVUs
	 CMPSK5cqn5PkoNeYuhwhh6micd5tAOnmg1799rKSdosjz2ZWKTgOYtPFM0cM64kHYd
	 AwWgtlbSzmiQIyR13yufqAqEhAyQUwuwwVHao91DK+Z38BpID8tQHN+DZwfTTywBtr
	 lY9z+DQHduoeA==
Date: Tue, 03 Oct 2023 09:15:31 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Janne Grunau <j@jannau.net>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH v1 03/12] drm/connector: extend PATH property to covert Type-C case
Message-ID: <cnx7qh-CGEiQ1zPNo1th85qcZYrw8fcWRQgb3a66yrdVvLrf8nZEmKjshodkHdWVdBS4Qzgj0FegzZLUhj890KSuZCe9l8ZC2Or9CZIlT2s=@emersion.fr>
In-Reply-To: <20230903214150.2877023-4-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org> <20230903214150.2877023-4-dmitry.baryshkov@linaro.org>
Feedback-ID: 1358184:user:proton
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sunday, September 3rd, 2023 at 23:41, Dmitry Baryshkov <dmitry.baryshkov=
@linaro.org> wrote:

> To facilitate this, reuse the 'PATH' property, which was used to
> describe the DP port in the DP MST configuration. Use either
> 'typec:portN' to point out to the Type-C port class device, or just
> 'typec:' if the corresponding port can not be identified.

Typo: should be "typec" without the colon I think?

What are the situations where the port cannot be identified? It seems
weird to use the PATH property in that case.

