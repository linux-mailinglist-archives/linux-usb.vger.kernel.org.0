Return-Path: <linux-usb+bounces-993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFD67B6102
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 08:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 3BB7F2818F9
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 06:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1253DCA76;
	Tue,  3 Oct 2023 06:51:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75EF62D;
	Tue,  3 Oct 2023 06:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AF4C433C7;
	Tue,  3 Oct 2023 06:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696315873;
	bh=JlKz8TnjKZB3qADozNp3jxhS6lFpcAtZkkpuPxyVPAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsB1b3ReOL2s0+k/5c4ftz8IQrp5C0DPi6B96/rPdrtzF3aEnfvABRIYnXQdo75un
	 ZmYp1Fq27VVjh63hY8aGkVZ7HwR/WmSLbpv6LqKiXgieOyZIgTafH2SJjQaHLvfEkw
	 8Dbt2E3vhlFM1x0uv3UdNqxol45aCztkCKx/Zk8w=
Date: Tue, 3 Oct 2023 08:50:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: peter.chen@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, xu.yang_2@nxp.com,
	peng.fan@nxp.com, avifishman70@gmail.com, tali.perry1@gmail.com,
	joel@jms.id.au, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, j.neuschaefer@gmx.net,
	openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/3] usb: ChipIdea: add Nuvoton NPCM UDC support
Message-ID: <2023100323-reunite-upfront-8922@gregkh>
References: <20231002161350.64229-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002161350.64229-1-tmaimon77@gmail.com>

On Mon, Oct 02, 2023 at 07:13:47PM +0300, Tomer Maimon wrote:
> This patch set add USB device controller for the NPCM Baseboard
> Management Controllers (BMC).
> 
> NPCM UDC driver is a part of the USB ChipIdea driver.
> 
> Adding CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag to modify the vbus_active
> parameter to active in case the ChipIdea USB IP role is device-only and
> there is no otgsc register.
> 
> BMC NPCM7XX and BMC NPCM8XX has ten identical NPCM UDC modules,
> 
> The NPCM UDC were tested on NPCM845 evaluation board.
> 
> Addressed comments from:
>  - Krzysztof Kozlowski : https://www.spinics.net/lists/kernel/msg4951321.html

Why is this a RESEND?


