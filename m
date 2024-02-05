Return-Path: <linux-usb+bounces-5894-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DE084A0CB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 18:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E2EE2836F1
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 17:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5181E44C6B;
	Mon,  5 Feb 2024 17:33:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C7E40BEB
	for <linux-usb@vger.kernel.org>; Mon,  5 Feb 2024 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707154381; cv=none; b=eY/M9pSq0YXoitI3l3Mdd1od4rY3Uhj+aHo/ujwQaByRMiEHErIx7dDSmHseicOA+BlVPIqw2vdKSCcaX8amCun4lNbInOLZa2q4qgxvUVIaCVihMka6yzmFNTB50Qfg12m9FmRo37bW8olAmyh9zU7Lt+KCD1nNhf+NkE+DOqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707154381; c=relaxed/simple;
	bh=5pjg0q1iZZDUw5lhiZeqbKPckptqUaLfzjykcGLxmBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwFgbFSbD2XYzhYak39917HCmoNDbaDtcMw0xAOeS1y/JDTRicBnxw3fCVOEjgy5JXmlZOgCl19KCZql+NsZKWV79wAW8S2Jxpt/diCGqVpO8oSIrcqHNCK60Jao2VHjf23WPdT+SYdAG5XdvFbkDqg9CBPFIzrm0ZNYMmjPTX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1rX2pn-0008FJ-Sy; Mon, 05 Feb 2024 18:32:43 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1rX2pm-004foU-LU; Mon, 05 Feb 2024 18:32:42 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1rX2pm-00CpRf-1r;
	Mon, 05 Feb 2024 18:32:42 +0100
Date: Mon, 5 Feb 2024 18:32:42 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>,
	gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 4/4] usb: typec: tcpci: add support to set connector
 orientation
Message-ID: <20240205173242.z56gbx2agwef3ufu@pengutronix.de>
References: <20240205164316.805408-1-m.felsch@pengutronix.de>
 <20240205164316.805408-5-m.felsch@pengutronix.de>
 <ZcESKqRTsGNZMMX1@gallifrey>
 <20240205165420.kyujim2takwswzmw@pengutronix.de>
 <8cffdf64-d0ee-4e20-8c43-d3010ddf9839@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cffdf64-d0ee-4e20-8c43-d3010ddf9839@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On 24-02-05, Guenter Roeck wrote:
> On 2/5/24 08:54, Marco Felsch wrote:
> > Hi David,
> > 
> > On 24-02-05, Dr. David Alan Gilbert wrote:
> > > * Marco Felsch (m.felsch@pengutronix.de) wrote:
> > > > This add the support to set the optional connector orientation bit which
> > > > is part of the optional CONFIG_STANDARD_OUTPUT register 0x18 [1]. This
> > > > allows system designers to connect the tcpc orientation pin directly to
> > > > the 2:1 ss-mux.
> > > > 
> > > > [1] https://www.usb.org/sites/default/files/documents/usb-port_controller_specification_rev2.0_v1.0_0.pdf
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >   drivers/usb/typec/tcpm/tcpci.c | 43 ++++++++++++++++++++++++++++++++++
> > > >   include/linux/usb/tcpci.h      |  8 +++++++
> > > >   2 files changed, 51 insertions(+)
> > > > 
> > > > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > > > index 7118551827f6..7ce9d4923bc7 100644
> > > > --- a/drivers/usb/typec/tcpm/tcpci.c
> > > > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > > > @@ -67,6 +67,18 @@ static int tcpci_write16(struct tcpci *tcpci, unsigned int reg, u16 val)
> > > >   	return regmap_raw_write(tcpci->regmap, reg, &val, sizeof(u16));
> > > >   }
> > > > +static bool tcpci_check_std_output_cap(struct regmap *regmap, u8 mask)
> > > > +{
> > > > +	unsigned int reg;
> > > > +	int ret;
> > > > +
> > > > +	ret = regmap_read(regmap, TCPC_STD_OUTPUT_CAP, &reg);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	return (reg & mask) == mask;
> > > > +}
> > > > +
> > > >   static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
> > > >   {
> > > >   	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> > > > @@ -301,6 +313,27 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
> > > >   			   TCPC_TCPC_CTRL_ORIENTATION : 0);
> > > >   }
> > > > +static int tcpci_set_orientation(struct tcpc_dev *tcpc,
> > > > +				 enum typec_orientation orientation)
> > > > +{
> > > > +	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> > > > +	unsigned int reg;
> > > > +
> > > > +	switch (orientation) {
> > > > +	case TYPEC_ORIENTATION_NONE:
> > > > +		/* We can't put a single output into high impedance */
> > > 
> > > Is that intended to be a fallthrough? If so I guess it needs
> > > marking as such with a
> > >                  fallthrough;
> > 
> > You need to add it if there is code in between. Since there is no code,
> > just this comment, it shouldn't be necessary.
> > 
> 
> Still, I think it would be desirable here to clarify that this
> is not a lost return but intentionally sets
> TCPC_CONFIG_STD_OUTPUT_ORIENTATION_NORMAL.

Sure, I will adapt it once the complete patchset is reviewed.

Regards,
  Marco

> Guenter
> 
> > Regards,
> >    Marco
> > 
> > > 
> > > Dave
> > > 
> > > > +	case TYPEC_ORIENTATION_NORMAL:
> > > > +		reg = TCPC_CONFIG_STD_OUTPUT_ORIENTATION_NORMAL;
> > > > +		break;
> > > > +	case TYPEC_ORIENTATION_REVERSE:
> > > > +		reg = TCPC_CONFIG_STD_OUTPUT_ORIENTATION_FLIPPED;
> > > > +		break;
> > > > +	}
> > > > +
> > > > +	return regmap_update_bits(tcpci->regmap, TCPC_CONFIG_STD_OUTPUT,
> > > > +				  TCPC_CONFIG_STD_OUTPUT_ORIENTATION_MASK, reg);
> > > > +}
> > > > +
> > > >   static void tcpci_set_partner_usb_comm_capable(struct tcpc_dev *tcpc, bool capable)
> > > >   {
> > > >   	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> > > > @@ -808,6 +841,9 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
> > > >   	if (tcpci->data->vbus_vsafe0v)
> > > >   		tcpci->tcpc.is_vbus_vsafe0v = tcpci_is_vbus_vsafe0v;
> > > > +	if (tcpci->data->set_orientation)
> > > > +		tcpci->tcpc.set_orientation = tcpci_set_orientation;
> > > > +
> > > >   	err = tcpci_parse_config(tcpci);
> > > >   	if (err < 0)
> > > >   		return ERR_PTR(err);
> > > > @@ -851,6 +887,13 @@ static int tcpci_probe(struct i2c_client *client)
> > > >   	if (err < 0)
> > > >   		return err;
> > > > +	err = tcpci_check_std_output_cap(chip->data.regmap,
> > > > +					 TCPC_STD_OUTPUT_CAP_ORIENTATION);
> > > > +	if (err < 0)
> > > > +		return err;
> > > > +
> > > > +	chip->data.set_orientation = err;
> > > > +
> > > >   	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
> > > >   	if (IS_ERR(chip->tcpci))
> > > >   		return PTR_ERR(chip->tcpci);
> > > > diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
> > > > index 467e8045e9f8..f2bfb4250366 100644
> > > > --- a/include/linux/usb/tcpci.h
> > > > +++ b/include/linux/usb/tcpci.h
> > > > @@ -47,6 +47,9 @@
> > > >   #define TCPC_SINK_FAST_ROLE_SWAP	BIT(0)
> > > >   #define TCPC_CONFIG_STD_OUTPUT		0x18
> > > > +#define TCPC_CONFIG_STD_OUTPUT_ORIENTATION_MASK		BIT(0)
> > > > +#define TCPC_CONFIG_STD_OUTPUT_ORIENTATION_NORMAL	0
> > > > +#define TCPC_CONFIG_STD_OUTPUT_ORIENTATION_FLIPPED	1
> > > >   #define TCPC_TCPC_CTRL			0x19
> > > >   #define TCPC_TCPC_CTRL_ORIENTATION	BIT(0)
> > > > @@ -127,6 +130,7 @@
> > > >   #define TCPC_DEV_CAP_2			0x26
> > > >   #define TCPC_STD_INPUT_CAP		0x28
> > > >   #define TCPC_STD_OUTPUT_CAP		0x29
> > > > +#define TCPC_STD_OUTPUT_CAP_ORIENTATION	BIT(0)
> > > >   #define TCPC_MSG_HDR_INFO		0x2e
> > > >   #define TCPC_MSG_HDR_INFO_DATA_ROLE	BIT(3)
> > > > @@ -198,12 +202,16 @@ struct tcpci;
> > > >    *		Chip level drivers are expected to check for contaminant and call
> > > >    *		tcpm_clean_port when the port is clean to put the port back into
> > > >    *		toggling state.
> > > > + * @set_orientation:
> > > > + *		Optional; Enable setting the connector orientation
> > > > + *		CONFIG_STANDARD_OUTPUT (0x18) bit0.
> > > >    */
> > > >   struct tcpci_data {
> > > >   	struct regmap *regmap;
> > > >   	unsigned char TX_BUF_BYTE_x_hidden:1;
> > > >   	unsigned char auto_discharge_disconnect:1;
> > > >   	unsigned char vbus_vsafe0v:1;
> > > > +	unsigned char set_orientation:1;
> > > >   	int (*init)(struct tcpci *tcpci, struct tcpci_data *data);
> > > >   	int (*set_vconn)(struct tcpci *tcpci, struct tcpci_data *data,
> > > > -- 
> > > > 2.39.2
> > > > 
> > > > 
> > > -- 
> > >   -----Open up your eyes, open up your mind, open up your code -------
> > > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> > > \        dave @ treblig.org |                               | In Hex /
> > >   \ _________________________|_____ http://www.treblig.org   |_______/
> > > 
> 
> 

