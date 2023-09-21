Return-Path: <linux-usb+bounces-433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C83707A9543
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 16:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 490C6B20A4A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 14:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0B8BE45;
	Thu, 21 Sep 2023 14:29:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544A5BA26;
	Thu, 21 Sep 2023 14:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63ACEC4E76B;
	Thu, 21 Sep 2023 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695306579;
	bh=9tvStd1eYmAawVVbsDie2tHpFeVMdoFAdNDNydF7QGQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=auje0uEUE+m+3g2jH1IuoGo/I0FUvd82445GiTAR/DKsQo1/fasU4p9KGyhJGfrFE
	 pWAi6ckAxzjwY/scpaEirq/9D+9BiIXEpXPSV4RSIhq3vcGMRisVhxOTnbhjDHlBrQ
	 qg+MR3Bx/jF9jhdb4hxEybOki6fx/onS1eehXeqGiirYCUigvmYfO3k+hYQcRO8tWv
	 NzId44tjuUKuIQNYd6obQzKHjfF/c5i2rtyGP+7B8B3agztfFTTUeWw2YpWinEIAvH
	 sfCxjqdAzU+d1HsF52XCeRJUxfho9A+PBQuBYcKrSkN8U7P4A1oBVf9E8n8B6n2Tqh
	 qhGQhWOoZLTfA==
From: Vinod Koul <vkoul@kernel.org>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
 kishon@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, gregkh@linuxfoundation.org, quic_srichara@quicinc.com, 
 quic_varada@quicinc.com, quic_wcheng@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Nitheesh Sekar <quic_nsekar@quicinc.com>
In-Reply-To: <20230904063635.24975-1-quic_nsekar@quicinc.com>
References: <20230904063635.24975-1-quic_nsekar@quicinc.com>
Subject: Re: (subset) [PATCH V4 0/4] Enable IPQ5018 USB2 support
Message-Id: <169530657502.106263.11564908217674550453.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 16:29:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Mon, 04 Sep 2023 12:06:31 +0530, Nitheesh Sekar wrote:
> This patch series adds the relevant phy and controller
> DT configurations for enabling USB2 host mode support
> on IPQ5018.
> 
> Tested with a USB Mass storage device.
> 
> Depends on:
> Link: https://lore.kernel.org/linux-arm-msm/20230831030503.17100-1-quic_nsekar@quicinc.com/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: qcom,m31: Add IPQ5018 compatible
      commit: 76bf09e08667f21bc3d1a8857f542c1ee54d9667
[2/4] phy: qcom-m31: Add compatible, phy init sequence for IPQ5018
      commit: 241da15bd783fd2ae3b2f16817d802102590aa0d

Best regards,
-- 
~Vinod



