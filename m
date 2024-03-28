Return-Path: <linux-usb+bounces-7646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76320874B35
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 10:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82BBCB21E1B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 09:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E137684FB9;
	Thu,  7 Mar 2024 09:46:32 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DB984FB7
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709804792; cv=none; b=KZ6xkQ/lPHu8P1WjefkLgrla2/ddZNSYRGqLM5k9WNmJwWNhlazHTWWaoaeEiCREs41jkKyFJ9ZeREdq9mT7WV8lgOnwn+hrxL2xq1wqDtSDDy60m4vMUmnRETorrnG3kd7aazIxkvSf6XZqzMm7PozGpK4vB5PLRpOSVQW4E04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709804792; c=relaxed/simple;
	bh=wmbWd6x+OjGeqEW39eS7Q3JfTpXKvNC6d/RLscj6RgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hb83tS4d3j+Z8A53rmEopbT6Gfbz35DYTGv3s7PRaKxOHNRV0lGu8rGOTuMYX9f7U+GxDAjXYp4U9GRY1hz8wvbpfe+ro7FNxG6ufJ1EF87u60YMU3skU/WkxxM7UmMp5S+CwmHFBvwKp1Ygsdgk+NNK8shaCM/eUyJ6LmnAO0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1riAKS-0002L8-Ue; Thu, 07 Mar 2024 10:46:20 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1riAKR-004uji-0B; Thu, 07 Mar 2024 10:46:19 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1riAKQ-006MWO-2u;
	Thu, 07 Mar 2024 10:46:18 +0100
Date: Thu, 7 Mar 2024 10:46:18 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net,
	jun.li@nxp.com
Subject: Re: [PATCH v3 4/4] usb: typec: tcpci: add support to set connector
 orientation
Message-ID: <20240307094618.b3yhzlq4y6y6qfqf@pengutronix.de>
References: <20240222210903.208901-1-m.felsch@pengutronix.de>
 <20240222210903.208901-5-m.felsch@pengutronix.de>
 <ZdxII9W/CBx76Xai@kuha.fi.intel.com>
 <20240226122701.inqpodm6mdfxwjo2@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226122701.inqpodm6mdfxwjo2@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi,

gentle ping, since Greg started to pick the other patches.

On 24-02-26, Marco Felsch wrote:
> Hi,
> 
> On 24-02-26, Heikki Krogerus wrote:
> > On Thu, Feb 22, 2024 at 10:09:03PM +0100, Marco Felsch wrote:
> > > This add the support to set the optional connector orientation bit which
> > > is part of the optional CONFIG_STANDARD_OUTPUT register 0x18 [1]. This
> > > allows system designers to connect the tcpc orientation pin directly to
> > > the 2:1 ss-mux.
> > > 
> > > [1] https://www.usb.org/sites/default/files/documents/usb-port_controller_specification_rev2.0_v1.0_0.pdf
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > > v3:
> > > - no changes
> > > v2:
> > > - Make use of fallthrough 
> > > 
> > >  drivers/usb/typec/tcpm/tcpci.c | 44 ++++++++++++++++++++++++++++++++++
> > >  include/linux/usb/tcpci.h      |  8 +++++++
> > >  2 files changed, 52 insertions(+)
> > > 
> > > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > > index 7118551827f6..73a52e7f95c2 100644
> > > --- a/drivers/usb/typec/tcpm/tcpci.c
> > > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > > @@ -67,6 +67,18 @@ static int tcpci_write16(struct tcpci *tcpci, unsigned int reg, u16 val)
> > >  	return regmap_raw_write(tcpci->regmap, reg, &val, sizeof(u16));
> > >  }
> > >  
> > > +static bool tcpci_check_std_output_cap(struct regmap *regmap, u8 mask)
> > > +{
> > > +	unsigned int reg;
> > > +	int ret;
> > > +
> > > +	ret = regmap_read(regmap, TCPC_STD_OUTPUT_CAP, &reg);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return (reg & mask) == mask;
> > > +}
> > > +
> > >  static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
> > >  {
> > >  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> > > @@ -301,6 +313,28 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
> > >  			   TCPC_TCPC_CTRL_ORIENTATION : 0);
> > >  }
> > >  
> > > +static int tcpci_set_orientation(struct tcpc_dev *tcpc,
> > > +				 enum typec_orientation orientation)
> > > +{
> > > +	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> > > +	unsigned int reg;
> > > +
> > > +	switch (orientation) {
> > > +	case TYPEC_ORIENTATION_NONE:
> > > +		/* We can't put a single output into high impedance */
> > > +		fallthrough;
> > > +	case TYPEC_ORIENTATION_NORMAL:
> > > +		reg = TCPC_CONFIG_STD_OUTPUT_ORIENTATION_NORMAL;
> > > +		break;
> > > +	case TYPEC_ORIENTATION_REVERSE:
> > > +		reg = TCPC_CONFIG_STD_OUTPUT_ORIENTATION_FLIPPED;
> > > +		break;
> > > +	}
> > > +
> > > +	return regmap_update_bits(tcpci->regmap, TCPC_CONFIG_STD_OUTPUT,
> > > +				  TCPC_CONFIG_STD_OUTPUT_ORIENTATION_MASK, reg);
> > > +}
> > > +
> > >  static void tcpci_set_partner_usb_comm_capable(struct tcpc_dev *tcpc, bool capable)
> > >  {
> > >  	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> > > @@ -808,6 +842,9 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
> > >  	if (tcpci->data->vbus_vsafe0v)
> > >  		tcpci->tcpc.is_vbus_vsafe0v = tcpci_is_vbus_vsafe0v;
> > >  
> > > +	if (tcpci->data->set_orientation)
> > > +		tcpci->tcpc.set_orientation = tcpci_set_orientation;
> > 
> > I don't think that flag is needed - not yet at least. Please just call
> > tcpci_check_std_output_cap() directly from here.
> 
> The reason for having it this way was to not break exsisting user like:
> tcpci_rt1711h, tcpci_mt6370, tcpci_maxim which may or may not implement
> the TCPC_STD_OUTPUT_CAP_ORIENTATION. This way the users of
> tcpci_register_port() can decide by on its own if they do have this
> feature or not and how this is checked. I'm fine with your proposal if
> you still think that we can check this unconditional.
						      ^
						      ?

Regards,
  Marco

> Regards,
>   Marco
> 
> > >  	err = tcpci_parse_config(tcpci);
> > >  	if (err < 0)
> > >  		return ERR_PTR(err);
> > > @@ -851,6 +888,13 @@ static int tcpci_probe(struct i2c_client *client)
> > >  	if (err < 0)
> > >  		return err;
> > >  
> > > +	err = tcpci_check_std_output_cap(chip->data.regmap,
> > > +					 TCPC_STD_OUTPUT_CAP_ORIENTATION);
> > > +	if (err < 0)
> > > +		return err;
> > > +
> > > +	chip->data.set_orientation = err;
> > > +
> > >  	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> > >  	if (IS_ERR(chip->tcpci))
> > >  		return PTR_ERR(chip->tcpci);
> > > diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
> > > index 467e8045e9f8..f2bfb4250366 100644
> > > --- a/include/linux/usb/tcpci.h
> > > +++ b/include/linux/usb/tcpci.h
> > > @@ -47,6 +47,9 @@
> > >  #define TCPC_SINK_FAST_ROLE_SWAP	BIT(0)
> > >  
> > >  #define TCPC_CONFIG_STD_OUTPUT		0x18
> > > +#define TCPC_CONFIG_STD_OUTPUT_ORIENTATION_MASK		BIT(0)
> > > +#define TCPC_CONFIG_STD_OUTPUT_ORIENTATION_NORMAL	0
> > > +#define TCPC_CONFIG_STD_OUTPUT_ORIENTATION_FLIPPED	1
> > >  
> > >  #define TCPC_TCPC_CTRL			0x19
> > >  #define TCPC_TCPC_CTRL_ORIENTATION	BIT(0)
> > > @@ -127,6 +130,7 @@
> > >  #define TCPC_DEV_CAP_2			0x26
> > >  #define TCPC_STD_INPUT_CAP		0x28
> > >  #define TCPC_STD_OUTPUT_CAP		0x29
> > > +#define TCPC_STD_OUTPUT_CAP_ORIENTATION	BIT(0)
> > >  
> > >  #define TCPC_MSG_HDR_INFO		0x2e
> > >  #define TCPC_MSG_HDR_INFO_DATA_ROLE	BIT(3)
> > > @@ -198,12 +202,16 @@ struct tcpci;
> > >   *		Chip level drivers are expected to check for contaminant and call
> > >   *		tcpm_clean_port when the port is clean to put the port back into
> > >   *		toggling state.
> > > + * @set_orientation:
> > > + *		Optional; Enable setting the connector orientation
> > > + *		CONFIG_STANDARD_OUTPUT (0x18) bit0.
> > >   */
> > >  struct tcpci_data {
> > >  	struct regmap *regmap;
> > >  	unsigned char TX_BUF_BYTE_x_hidden:1;
> > >  	unsigned char auto_discharge_disconnect:1;
> > >  	unsigned char vbus_vsafe0v:1;
> > > +	unsigned char set_orientation:1;
> > >  
> > >  	int (*init)(struct tcpci *tcpci, struct tcpci_data *data);
> > >  	int (*set_vconn)(struct tcpci *tcpci, struct tcpci_data *data,
> > > -- 
> > > 2.39.2
> > 
> > -- 
> > heikki
> > 
> 
> 

