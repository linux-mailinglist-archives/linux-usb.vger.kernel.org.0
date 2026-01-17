Return-Path: <linux-usb+bounces-32443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A56D38AAF
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 01:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A762330AF54E
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5E716A956;
	Sat, 17 Jan 2026 00:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfDR9dh0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07271494DB
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 00:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609547; cv=none; b=WqVtVzcvBmi5oSVd7x1p6cjwqzvfDEo//U/vQdnag4pnakrR9OETpKhuimD4tKnjc3cNT9KnA+P90oM8Wnsg3grz2Hf2nMCtyLf5ltF7J0hFBiG+wO/xjoGU5022bxD0LAzC7EiWiutylCxsLlr2gEp80zCgYbMAG0TeAcORcbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609547; c=relaxed/simple;
	bh=Id75euKpfQTJco8yENL5IWArmZd3XiPG2kUkByIZOUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mIk1AEL9aWGI8NGpeZjVHc9NH4CVnJXWYFQf+Sk80cJ7Cnspv9FMr+qP5vMpwSSsAsXUDi+CfYirDKC+NpPxuKUg69KNGVYRq77qNP40FlZmlyuncnyk5DikOsITQIMU5/8umB49UmzXum04oyxaU9JYXXe6/scqMiGS35miZ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfDR9dh0; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3735385eec.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 16:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609545; x=1769214345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs/w5dukbECq6vP+JVY/PT3LY1xl+bSBRNaUMsBTQvY=;
        b=bfDR9dh07Ax8yCTUpMajEXGrrxJvdyZl6MQIkskM2fNP3et7b2njGJgjGUlc908qbk
         b9WLI6WMyMA18iOAi+BM5A8abDMKOMGM4j8XJTOu5KvO7YzS4/LkPAWn0eNzqtX6hdVu
         rZblcccOEJXr6NdVzSc2lpdeTTizyNf9apFtYL5fEwOlRHvZ6fX+k/kqIBK3mKQTk2eD
         BIjgDXiVes6u27kFXovWrbI6kshYWYc6nDMbq35+X1XNLReJMfE2tmChjqlYeoqxTZWn
         I6EXGragJ2eGeSmccFmuALCUel7GnL6ZX0Azy4n1G+gWRYTZzYcWuzeYvVmJEgcD7/Re
         apew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609545; x=1769214345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cs/w5dukbECq6vP+JVY/PT3LY1xl+bSBRNaUMsBTQvY=;
        b=qm2ZWbgU6Z/8lSidtVgkOj0OwfNzyX/gnULddj83bi876PXAQYBdNePIt/TkFUdiFW
         LCRJSr4vlxPpW6pn4uUXqy1yMo+zYx7hExvpUXYtsfi8/mITBa+O2aLJbMT1RqTTZzv8
         Kh1/4kHsuofYkBSWAtg1hZPJ/kKxSjXPOm4ca/6dhzNt4PWcRjvzJRNAnVnzrVqDh6/I
         jQdLmFHp1JX1XmzSH6sTgXQbodTXWZui4ChD3nFQrz2QXH3fIRFk1Bu4jbhjNXkF492X
         uDjkPmDFmd4CB3gsww8yyjeg0jCGse3haxCdi0EACKReqQDzl5TvVjlcDL1mp1GM/tuK
         STHA==
X-Gm-Message-State: AOJu0YwShJE4Qz6PfUMlgcRTURLy/LhfQGCzHGN72GIhPzmlKo4bKnq5
	AzY6TV0zjEbTXzGkbRnTMLMT6rsmeVVRCcX5brgVRcaIRiZB7tghQc4V
X-Gm-Gg: AY/fxX75umtQBT00rjPaIsY0yK4Amz8EbjvXl8Q8Xm3SQHSfId9Dyup6NvZvTPAF6cv
	jDcNQQzwKjMYyJgxGfCzc8co7ld4nvKeFJfJUXO7rQZtyWvKLiKDZmP45qC2mJ73PtOvMM15iy5
	bB93ZDdcaHgoOPvJd3Yk3hsJg5qJOtF85Lj8zf9VPBASKqGn62eLe7sSy7Vryc77N2d+WhPUe+l
	mI+aGhHEtZEB2p2OIzJg8aaitSjotttDrTN4dke6TXPERC9iZvo3ymEk2uVPU1eq9rfvELkQaDo
	h9C+6tNMvInlMbNWl5VW+0Zxrb1cVv6WWM1td/oRVvo3Sa6t3U6RY77/Lj3yCoDA1b2sqDZYeqZ
	sCFKETr/k1wLXH2J4p0ln04Z46jMRz/IqL7Hjlh7m+OUOo5Uncd5Xx5AylR4MiVvH0Pfvuj6cs0
	Hcg9NyG7BfFs/gTxWGq9UIOJKI1Jh7YrA/xHRfbmuikw8mpy1zFCZrGwk5ZDnclKIt8QQh5S4AW
	+M8klq8UHPodueocQ==
X-Received: by 2002:a05:7301:2e87:b0:2ab:8ef5:df2 with SMTP id 5a478bee46e88-2b6b40f0c13mr3046636eec.35.1768609544724;
        Fri, 16 Jan 2026 16:25:44 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3682540sm3944277eec.34.2026.01.16.16.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:25:44 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	JC Kuo <jckuo@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] Fixes to Tegra USB role switching and Smaug USB role switching enablement
Date: Sat, 17 Jan 2026 01:25:33 +0100
Message-ID: <176860947663.1613073.5692699224170959766.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 04 Dec 2025 21:27:16 +0000, Diogo Ivo wrote:
> This patch series contains two fixes for USB role switching on the
> Tegra210 SoC, as well as enabling this feature on the Pixel C.
> 
> The first patch addresses a wrong check on the logic that disables the
> VBUS regulator.
> 
> The second patch guarantees proper ordering of events when switching PHY
> roles.
> 
> [...]

Applied, thanks!

[4/5] arm64: tegra: smaug: Complete and enable tegra-udc node
      (no commit info)
[5/5] arm64: tegra: smaug: Add usb-role-switch support
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

