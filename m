Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1CE4FF4A7
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 12:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbiDMK0r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 06:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbiDMK0o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 06:26:44 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EAD21270
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649845464; x=1681381464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K7whBa3hdiohBiIZEA+HBRW2XPgMguCVzh9k5HMVw+A=;
  b=aw/+4ouNQP2THDsHD4hXYrql5ymrjWXfpvye4x+hEqgTxYRl+R5ifLza
   By8zc3vUHQx7EX0uu/RxcdQKUABOorQuDlj+ulXGchrNvFTb7v4TSm2cW
   lOfNijnKv1vTpaveQij0tsFM4VpIsJ+VtHgR1bDG+nfBF1+ynibrmlZOE
   lQ4Fi3YJ/Pza2aIDHVKidjGnx0RoQTGpcmsTVGmMfo8sXFc1ETIV4aQ9Q
   32b/IopkAVxwQK+BfO/QJSZDRGm4hDlphHFG773dKk4x4NSxoy2PwZXAH
   47QAHRv8N01KuirNSRm8wCbbhw97kULM6TfToxzW7nJozqAxnkM5puoNC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="261478843"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="261478843"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 03:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700197055"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2022 03:24:21 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 13 Apr 2022 13:24:21 +0300
Date:   Wed, 13 Apr 2022 13:24:21 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
 module load late
Message-ID: <Ylak1cJylsOrzwL7@kuha.fi.intel.com>
References: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649759407-24049-4-git-send-email-quic_linyyuan@quicinc.com>
 <YlZ/wrIRUD7HpMDB@kuha.fi.intel.com>
 <DM8PR02MB819850DA69CED34F1B31B6EBE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YlaFVUyJPkKJpi2D@kuha.fi.intel.com>
 <DM8PR02MB8198536D2D5962F6FB5DB789E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB8198536D2D5962F6FB5DB789E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 13, 2022 at 08:16:53AM +0000, Linyu Yuan (QUIC) wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Wednesday, April 13, 2022 4:10 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> > usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> > Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
> > module load late
> > 
> > On Wed, Apr 13, 2022 at 08:00:35AM +0000, Linyu Yuan (QUIC) wrote:
> > > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Sent: Wednesday, April 13, 2022 3:46 PM
> > > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> > > > usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> > > > Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
> > > > module load late
> > > >
> > > > On Tue, Apr 12, 2022 at 06:30:07PM +0800, Linyu Yuan wrote:
> > > > > When role switch enabled, return -EAGAIN if fail to find it due to
> > > > > module load ordering issue, then restart ucsi init work to find
> > > > > it again every 100ms.
> > > > >
> > > > > It also means change ucsi init work to delayed_work.
> > > > >
> > > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > > > ---
> > > > >  drivers/usb/typec/ucsi/ucsi.c | 28 ++++++++++++++++------------
> > > > >  drivers/usb/typec/ucsi/ucsi.h |  2 +-
> > > > >  2 files changed, 17 insertions(+), 13 deletions(-)
> > > > >
> > > > > diff --git a/drivers/usb/typec/ucsi/ucsi.c
> > b/drivers/usb/typec/ucsi/ucsi.c
> > > > > index 684fc4f..fabd4df 100644
> > > > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > > > @@ -1053,6 +1053,14 @@ static int ucsi_register_port(struct ucsi *ucsi,
> > int
> > > > index)
> > > > >  	con->num = index + 1;
> > > > >  	con->ucsi = ucsi;
> > > > >
> > > > > +	cap->fwnode = ucsi_find_fwnode(con);
> > > > > +	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
> > > > > +	if (IS_ERR(con->usb_role_sw)) {
> > > > > +		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> > > > > +			index + 1);
> > > > > +		return -EAGAIN;
> > > > > +	}
> > > >
> > > > No, this is wrong. If there is a role switch assigned in the firmware
> > > > for the port, then fwnode_usb_role_switch_get() will return
> > > > -EPROBE_DEFER until the switch has been registered.
> > > >
> > > > So I think what you want to do is just make the failure to get the
> > > > role switch fatal in this driver. Just return PTR_ERR(con->usb_role_sw).
> > > Thanks, will change it to check -EPROBE_DEFER.
> > 
> > No, you don't check that, you just return that.
> Yes, I do like it.
> > 
> > So you don't need that crazy polling mechanism where you queue a work
> > until you get the resource. Just let the driver core handle the
> > situation.
> The issue is when a UCSI implementation driver probe, it call ucsi_register(),
> But this function will not return -EPROBE_DEFER,
> It just queue a work to start connector discovery.

Ah, right right. This is a library. But we should be able use
wait_for_device_probe().

So if fwnode_usb_role_switch_get() returns -EPROBE_DEFER, you call
wait_for_device_probe() and try again.

Br,

-- 
heikki
