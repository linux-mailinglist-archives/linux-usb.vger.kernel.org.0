Return-Path: <linux-usb+bounces-18576-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 193869F477D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F5E61617E2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B971DDC03;
	Tue, 17 Dec 2024 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="rA2z4up/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05455EEB2
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427753; cv=none; b=EARFabTnD/8FjSa9/g+BDa4zvl/osEQPPQ43Juzo7zi1FPlWWHhYswPYkHOB2kUoNw4oNcpmiINGQ2ymt/iutUPtduGe3CstkbsyV40vbN5QJUOf5enRQj7oY9+Dy/fHdwNYH2drDnoUNdXSPneNeP2ZtTDM96HbpQIRW/udcD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427753; c=relaxed/simple;
	bh=6EsR1fEePDqd7eW7ARPwVy7kxfj5U4yICOiUVKDoqZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4epnEHPBvx0xhk3WnJFrZWaXBx6tp1F+tm4IzkTyApkKaLTRJf6TyIA8OhrzdKa40ywORMF+7YYjk7EQvk3T2FuMjq/Iop4Hst5c9yT1KqKrO7NhesjaqsRucyBkLBc8dFe5RY1W0XdLMj8uZ0s+lqPoAFNiYaKSJgzUjycC18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=rA2z4up/; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5E0981FCF9;
	Tue, 17 Dec 2024 10:29:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734427750;
	bh=yJKtBsWc7dPmPTDAETF1bwIRjDSjPeGWjKE21ceWNoA=; h=From:To:Subject;
	b=rA2z4up/vwt7PbPE3+iMFu+Mfeu465MQgIhW0A1lAXMsC00hqEtGZATqirkac/YX1
	 ac/uCTVvAeHno8p/uJpI6pGvQRXeM4/xJaI6XHJP9cULSzTdsFVydcgcexUVKm4sHs
	 L8xYnbhApdTQ9OqbOCfPtdINLi5NZLvNjPmQQi86xV4z0e5tnmmeWKxTk271jj0mAy
	 AQh/4NthJnH78Byzobcbl0+ZmD/ppJdoef9kcjcTLqpgxbYUrWr/KQHDtqt9qg3kkJ
	 IkdNCQG0nlHz9L5vexbFWA8khKUz4NaoqX9wdvCBQTpv+2o+sNXFjBBaW5u+U7vNQ1
	 2P7BcnhPvmlkw==
Date: Tue, 17 Dec 2024 10:29:05 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <20241217092905.GA27489@francesco-nb>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217091208.2416971-2-xu.yang_2@nxp.com>

On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> With edge irq support, the ALERT event may be missed currently. The reason
> is that ALERT_MASK register is written before devm_request_threaded_irq().
> If ALERT event happens in this time gap, it will be missed and ALERT line
> will not recover to high level. However, we don't meet this issue with
> level irq. To avoid the issue, this will set ALERT_MASK register after
> devm_request_threaded_irq() return.
> 
> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v3:
>  - remove set_alert_mask flag
> Changes in v2:
>  - new patch
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index db42f4bf3632..48762508cc86 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -700,7 +700,7 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>  
>  	tcpci->alert_mask = reg;
>  
> -	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
> +	return 0;

Should we set the alert mask to 0 at the beginning of tcpci_init() ?

Just wondering if some bind/unbind or module reload use case would need
it.

Francesco


