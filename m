Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CECE4FF58F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 13:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiDMLWN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 07:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbiDMLWL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 07:22:11 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7EB69FE7
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 04:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649848789; x=1681384789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UDutIbsfp5Ri862ew0y41ghHZ3FRRm3/XTtg6EV0K2U=;
  b=GugCMjz6ArVUvjqQlCxdgqY0lUoxsfDktriF6PDlVfwkyIo2vGMVJ6rU
   HeSrZieLbHzLN8nf2QSERnYLB37W0Qj8vJg9fFwzvD3q/RfK85K/Az3Np
   EGOgv2taO1T6aimu9umPuE3hgWS4wUwUYKAAhlIVBKYRs8pEnbuzrGKtO
   yoMThiD9HKQ74DMCt3lDnhr/l6n9UjT97JExXiHXHAcENFoizBi2MLh2a
   jJU55Zhsesmk0s17WsTSqIl03eOuGeK8ilUww4G0EZDfW9vSG22FfCTwW
   d8NK8iOm9Hm1uejm8KppLy6JYW/i6nGR3B7BWqMJkHxWJO4/MR3MLmqAR
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262391357"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="262391357"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 04:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="700209481"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2022 04:19:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 13 Apr 2022 14:19:45 +0300
Date:   Wed, 13 Apr 2022 14:19:45 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
 module load late
Message-ID: <Ylax0XUIjKUd9Cls@kuha.fi.intel.com>
References: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649759407-24049-4-git-send-email-quic_linyyuan@quicinc.com>
 <YlZ/wrIRUD7HpMDB@kuha.fi.intel.com>
 <DM8PR02MB819850DA69CED34F1B31B6EBE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YlaFVUyJPkKJpi2D@kuha.fi.intel.com>
 <DM8PR02MB8198536D2D5962F6FB5DB789E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <Ylak1cJylsOrzwL7@kuha.fi.intel.com>
 <DM8PR02MB81987D9C894698FF63B7B27AE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB81987D9C894698FF63B7B27AE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 13, 2022 at 11:01:23AM +0000, Linyu Yuan (QUIC) wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Wednesday, April 13, 2022 6:24 PM
> > > > No, you don't check that, you just return that.
> > > Yes, I do like it.
> > > >
> > > > So you don't need that crazy polling mechanism where you queue a work
> > > > until you get the resource. Just let the driver core handle the
> > > > situation.
> > > The issue is when a UCSI implementation driver probe, it call ucsi_register(),
> > > But this function will not return -EPROBE_DEFER,
> > > It just queue a work to start connector discovery.
> > 
> > Ah, right right. This is a library. But we should be able use
> > wait_for_device_probe().
> > 
> > So if fwnode_usb_role_switch_get() returns -EPROBE_DEFER, you call
> > wait_for_device_probe() and try again.
> Do you mean do as below,
> 
> find_role_switch:
> 	con->usb_role_sw = fwnode_usb_role_switch_get(cap->fwnode);
> 	if (IS_ERR(con->usb_role_sw)) {
> 		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> 			con->num);
> 		if (con->usb_role_sw == -EPROBE_DEFER) {
> 			wait_for_device_probe();
> 			goto find_role_switch;
> 		}
> 
> 		return PTR_ERR(con->usb_role_sw);
> 	}

Yes, something like that. Perhaps you could just do that in a loop,
and you should have a delay there.

> Seem wait_for_device_probe() will wait all drivers probe,
> Can we accept it ?

That part is not a problem, but I'm not sure if it appropriate to call
the function from drivers. Let me check if there is something else
that we can do...

thanks,

-- 
heikki
