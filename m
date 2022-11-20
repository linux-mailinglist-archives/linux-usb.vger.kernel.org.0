Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 611E3631591
	for <lists+linux-usb@lfdr.de>; Sun, 20 Nov 2022 18:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiKTRph (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Nov 2022 12:45:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiKTRpe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 12:45:34 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067601D0D4
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 09:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=8MeMD0gXIv7orGdbETVPdr70c4/LSaDFMPrFgViohPo=; b=KWycc
        2QaE6JS4zVT5xe7ZMplLxnbHvhXKlWbtTowvLT8DminTmYqH02/Ye1y04rIgTQX8dx7PVz343r4kc
        CrFlTrqUvmNhiGVY6M9zsRWO6Tnjhhkjkrvt7Li1C/uCW94LJjnrktpShV44kZIdXsV1W/5akDmab
        +cvc0flGE/1rhtcOaulpjI6kXHCawr7SVRnVMb6imB6pZ3dney0CcL/4I7+4Vr/mbPhHgapWWCnK+
        9yTY34+tzmryMYeHrXJwsr/gb4IX6/Dd2bTK2yJNxe9wTC8YJyNT11UOIN1mCjQgz6dW+ysAaFNBu
        QLmSFdCUnbiJN4Ahh9jRF0gNcdRBw==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <john@metanate.com>)
        id 1owoNl-0002Vn-05;
        Sun, 20 Nov 2022 17:45:29 +0000
Date:   Sun, 20 Nov 2022 17:45:28 +0000
From:   John Keeping <john@metanate.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Jack Pham <quic_jackp@quicinc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH] usb: gadget: configfs: Prevent double delete from
 purge_configs_funcs
Message-ID: <Y3pnuBfdNKtuDFqs@donbot>
References: <20221117053548.28158-1-quic_ugoswami@quicinc.com>
 <Y3e0ANWtax4SVONK@donbot>
 <cea921b8-a0d1-fb71-0a6c-fc93ff369f0d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cea921b8-a0d1-fb71-0a6c-fc93ff369f0d@quicinc.com>
X-Authenticated: YES
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Nov 20, 2022 at 12:40:54PM +0530, Udipto Goswami wrote:
> On 11/18/22 10:04 PM, John Keeping wrote:
> > On Thu, Nov 17, 2022 at 11:05:48AM +0530, Udipto Goswami wrote:
> > > Currently the function purge_configs_funcs isn't protected by any lock
> > > So there is a potential race possible there id udc called composite_unbind
> > > and say at the same time the configfs_composite_bind also got executed.
> > > If bind fails and follows the error path, driver will end up calling the
> > > purge_configfs_funcs again, resulting in double free from func_list.
> > > 
> > > Fix this by introducing mutex gi->lock to make sure serial execution
> > > can be maintained. Also, usage of list_for_each_entry_safe is risky
> > > here since the tmp variable is still valid for the next iteration, in
> > > order to ensure list traversal is clean, use list_last_entry.
> > 
> > I don't understand how this can happen.
> > 
> > purge_configs_funcs() is called from the .bind and .unbind
> > usb_gadget_driver hooks, and those should not be able to run at the same
> > time - if bind has not succeeded, how does unbinding make sense?
> 
> Consider this,
> we are going out of the composition i.e unbinding it,
> lets say we have 7 functions and we were only at removing the 2 one where in
> the meantime the bind process got called, the udc driver doesn't make sure
> of this, depends on the controller when they call the usb_add_gadget
> probably.
> 
> For dwc3 controller specifically, the mode will still be device  so from
> core.c will end up calling gadget_init() which in turn will call
> usb_add_gadget which further does to check_pending_gadget_drivers,
> eventually calling bind.

I can't find functions called gadget_init() or
check_pending_gadget_drivers() in the kernel.

> So, i don't see any serializing mechanism here which would stop the
> execution of make the controller wait until the unbind is completed right.
> Please correct me if i'm wrong.

The comments in configfs_composite_bind() and
configfs_composite_unbind() indicate that gi->lock is held by the caller
for both these functions.

I checked that this is the case for configfs gadgets, so it's possible
that one of the legacy paths has a bug where it is not holding this
lock, but adding the extra lock calls in the patch below will deadlock
with configfs.

> > 
> > > Fixes: 6cd0fe913879 ("usb: gadget: configfs: Preserve function ordering after bind failure")
> > > Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> > > ---
> > >   drivers/usb/gadget/configfs.c | 9 +++++----
> > >   1 file changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> > > index 3a6b4926193e..f1ac87906897 100644
> > > --- a/drivers/usb/gadget/configfs.c
> > > +++ b/drivers/usb/gadget/configfs.c
> > > @@ -1246,14 +1246,14 @@ static void purge_configs_funcs(struct gadget_info *gi)
> > >   {
> > >   	struct usb_configuration	*c;
> > > +	mutex_lock(&gi->lock);
> > >   	list_for_each_entry(c, &gi->cdev.configs, list) {
> > > -		struct usb_function *f, *tmp;
> > > +		struct usb_function *f;
> > >   		struct config_usb_cfg *cfg;
> > >   		cfg = container_of(c, struct config_usb_cfg, c);
> > > -
> > > -		list_for_each_entry_safe_reverse(f, tmp, &c->functions, list) {
> > > -
> > > +		while (!list_empty(&c->functions)) {
> > > +			f = list_last_entry(&c->functions, struct usb_function, list);
> > >   			list_move(&f->list, &cfg->func_list);
> > >   			if (f->unbind) {
> > >   				dev_dbg(&gi->cdev.gadget->dev,
> > > @@ -1269,6 +1269,7 @@ static void purge_configs_funcs(struct gadget_info *gi)
> > >   		c->highspeed = 0;
> > >   		c->fullspeed = 0;
> > >   	}
> > > +	mutex_unlock(&gi->lock);
> > >   }
> > >   static int configfs_composite_bind(struct usb_gadget *gadget,
