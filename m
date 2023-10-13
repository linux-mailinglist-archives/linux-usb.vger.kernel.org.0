Return-Path: <linux-usb+bounces-1566-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8519F7C838D
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 12:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 411A7282D6D
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 10:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B250E125CF;
	Fri, 13 Oct 2023 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6+JpUQe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2C111AA;
	Fri, 13 Oct 2023 10:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD22C433C7;
	Fri, 13 Oct 2023 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697193935;
	bh=0ZLfe7SbZuvOaoiV89P70O3iNcAqcUL0z/OoDUfELrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6+JpUQenSk2gmtCrWeMpEH0VpBqJLlmvUeoG1r1jMVximEsXRUIHfYWRia1P5fpM
	 n9MXnR4n7F/KlmzyV0SG/N3+tPOSFPQR25rbHqNWOpq5XU1YiN40mE5jlA91lTZkS2
	 QYHPjl/uZXU8Vv4rSXSvt7cj+gSNlaZgICfipqgq7JPII/2xvBFb5jEahP24V0n9qL
	 2AtPi8aNujI0mGfQ5n09zgsmtTksAHhC9datsJitZEcnLUTI/hX+IrdKnaYkQ/dCpq
	 dsvI44TKZYpiXg0OFTvRXSWcd20yJxpI/Jh9HZHSiHozGH6F5ybU4lhRQRLioOJ3UN
	 H+xV+UMyVCkfA==
Date: Fri, 13 Oct 2023 16:15:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	kishon@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, abel.vesa@linaro.org,
	quic_wcheng@quicinc.com, dmitry.baryshkov@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v4 0/5] Add USB Support on Qualcomm's SDX75 Platform
Message-ID: <ZSkfyl757VXnfIjw@matsya>
References: <1695359525-4548-1-git-send-email-quic_rohiagar@quicinc.com>
 <ZSkb9ajLZGpD46Ik@matsya>
 <b88cc301-52db-4401-8364-7056f0e10149@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b88cc301-52db-4401-8364-7056f0e10149@quicinc.com>

On 13-10-23, 16:08, Rohit Agarwal wrote:
> 
> On 10/13/2023 3:59 PM, Vinod Koul wrote:
> > On 22-09-23, 10:42, Rohit Agarwal wrote:
> > > Hi,
> > > 
> > > Changes in v4:
> > >   - Replaced the v5 offsets with v6 offsets as per Dmitry's suggestion in patch 5/5.
> > > 
> > > Changes in v3:
> > >   - Removed the unnecessary change introduced in v2 of patch 2/5
> > >   - Added Fixes tag in patch 3/5
> > >   - Rebased patch 5/5 on Dmitry's cleanup patches.
> > >     https://lore.kernel.org/all/20230911203842.778411-1-dmitry.baryshkov@linaro.org/
> > >     https://lore.kernel.org/linux-phy/20230824211952.1397699-1-dmitry.baryshkov@linaro.org/
> > > 
> > > Changes in v2:
> > >   - Dropped the new dt schema introduced in v1 for sdx75 usb3 phy
> > >     and reusing the bindings.
> > >   - Rephrased the commit message of patch 3/5
> > >   - Removed stray lines from the patch 5/5
> > > 
> > > This series adds support of USB3 PHY support for Qualcomm's SDX75 Platform.
> > The phy patches fail to apply, can you please rebase the three patches
> > and resend
> Can you please apply these two series. This series depends on it for
> successful compilation.
> [1] https://lore.kernel.org/all/20230911203842.778411-1-dmitry.baryshkov@linaro.org/

This one has a pending comment bw Konrad and Dmitry..

> [2] https://lore.kernel.org/linux-phy/20230824211952.1397699-1-dmitry.baryshkov@linaro.org/

This one is already in -next

> 
> Thanks,
> Rohit.

-- 
~Vinod

