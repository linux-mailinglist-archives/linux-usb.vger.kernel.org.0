Return-Path: <linux-usb+bounces-18578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 620009F47EA
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A5F6189321C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AFE1DF975;
	Tue, 17 Dec 2024 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ygHza7a7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59721DEFC2
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428759; cv=none; b=rMreRkO8wwkLsZbaGouTcpQ1JSRCkOVZLgQzP2f/S/DzQnP1YQOuwmAxKXNwdRVUsGnYyp8vkCOnW3EiymUo67kRJ3r3drLvCBvbqfMXe5ItMaRsuSYaZ2umMeUtHxq+28ThXCmL3o+01m39wkRL+wgxkw5DQqw9iqbfm9SWFsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428759; c=relaxed/simple;
	bh=yWGdHIYeW/qGqkS3mGGDdmrdIyQKM1Z2hHYlmKN0Tik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTCzHmbF+Wn9g5rM7p5n798nXxT6eYg0BG3VQrQaVUDLVcN2MSGia6PtG4EmJzylNUKDfeN9f2rXkfYgqoPOjIH5eu5iszxm6xPPtBdpEJU7v6ty1IpIIbtRdGWcny+SniuoBitYQcwy7L1QL0UyVgL2XlQYUDnjzAP5EAo+I6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ygHza7a7; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 58FCA20667;
	Tue, 17 Dec 2024 10:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734428756;
	bh=xUfq5+t4yTvAeS+XVM4QO2QwLt0mcLy8TKIMnb/O/K0=; h=From:To:Subject;
	b=ygHza7a7pxaxdKl3pRPwBMqmeFtad/Y7kLgAU/T8+SfS3uRXD8w72F0VjF84FOVh+
	 8hd7C/rO1OzRVq5YJLAkgd7yFmprlmDsX+9u2GcSHss9sXaYuuNYhhruEoMrSANB3S
	 M0/UX5Hpj9b7KoRrnFYOz0OeGjlevMWqPKVSiAIWT5+G+YRarWTS86MD7hjWI6qznQ
	 PXqKU0jIv4gSStrT475S/dcdXI0+HirbHumoDVQHnNOXl997LkomSeGJHOR6LG7s+H
	 UmXY7GMp99ap1tfTKRxGBWcGSDk39X8UO1HgZabPdbcchanOt1y2WSgMhZZx+qdn0O
	 Y3uXE5jJ93XbQ==
Date: Tue, 17 Dec 2024 10:45:53 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <20241217094553.GB25802@francesco-nb>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
 <20241217092905.GA27489@francesco-nb>
 <20241217094117.xb27iww4dmq2ehvl@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217094117.xb27iww4dmq2ehvl@hippo>

On Tue, Dec 17, 2024 at 05:41:17PM +0800, Xu Yang wrote:
> On Tue, Dec 17, 2024 at 10:29:05AM +0100, Francesco Dolcini wrote:
> > On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> > > With edge irq support, the ALERT event may be missed currently. The reason
> > > is that ALERT_MASK register is written before devm_request_threaded_irq().
> > > If ALERT event happens in this time gap, it will be missed and ALERT line
> > > will not recover to high level. However, we don't meet this issue with
> > > level irq. To avoid the issue, this will set ALERT_MASK register after
> > > devm_request_threaded_irq() return.
> > > 
> > > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v3:
> > >  - remove set_alert_mask flag
> > > Changes in v2:
> > >  - new patch
> > > ---
> > >  drivers/usb/typec/tcpm/tcpci.c | 17 ++++++++++++-----
> > >  1 file changed, 12 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > > index db42f4bf3632..48762508cc86 100644
> > > --- a/drivers/usb/typec/tcpm/tcpci.c
> > > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > > @@ -700,7 +700,7 @@ static int tcpci_init(struct tcpc_dev *tcpc)
> > >  
> > >  	tcpci->alert_mask = reg;
> > >  
> > > -	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
> > > +	return 0;
> > 
> > Should we set the alert mask to 0 at the beginning of tcpci_init() ?
> > 
> > Just wondering if some bind/unbind or module reload use case would need
> > it.
> 
> Maybe not needed.
> 
> tcpci = devm_kzalloc(dev, sizeof(*tcpci), GFP_KERNEL);
> 
> tcpci will be reset to all 0 when allocate the memory. So alert_mask is 0
> by default.

I meant

  tcpci_write16(tcpci, TCPC_ALERT_MASK, 0);

in tcpci_init().


