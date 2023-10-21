Return-Path: <linux-usb+bounces-2047-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1377D1E07
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 17:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0788B210AF
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 15:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214FD19BD4;
	Sat, 21 Oct 2023 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7r92sa5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799D018B1C
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 15:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7356BC433C7;
	Sat, 21 Oct 2023 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697903695;
	bh=HWo98UYfbw0UhK3vGgyWXaafm5tAJGwjK0+jUmOj2tw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K7r92sa5YYZ0eC0cCc3pbBDRoWk1o2H3yfrlDY0Tfpi+2+rfXvo7jN7Auz8/EuDU8
	 mPFi6fUlGgfQZC5/GRvMX1OKn5lEkxChO6b4kHa1G/liZEUyfLejEqQARYujrrYiCj
	 KCCA5UHJ01vr9Z9BOuBe1wEIDwoDaf6KnJeNz124UprEadvlLviJrlcWis8gUspNpA
	 iKgHZF2TbS07UnHVksVx9iT8r3sXQbPoMrfmCIiohhrKoBN/TNY+wdTgKwXdyEqMvv
	 6Da2I2MSDCOBiEAXB/REa4HwQxX2TyRqrHIxXXyW3KOSmmpJ0FtsJ2rOZDIS1VieHO
	 UZvL2iCMCjogA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
Date: Sat, 21 Oct 2023 08:58:30 -0700
Message-ID: <169790390703.1690547.4994439260271212521.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Oct 2023 13:32:44 +0300, Dmitry Baryshkov wrote:
> Enable Qualcomm PMIC TCPM driver, it is used to handle Type-C ports on
> devices like Qualcomm Robotics RB5 platform.
> 
> 

Applied, thanks!

[1/2] arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
      commit: 323c7ec86446e8364cf338f40297194cc7a159fa
[2/2] arm64: defconfig: enable DisplayPort altmode support
      commit: f93b8a5705c6886a4c5ec6d142730927d891b6f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

