Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5845153D26C
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jun 2022 21:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242163AbiFCThr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 15:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237761AbiFCThq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 15:37:46 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 7D6C6326CF
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 12:37:45 -0700 (PDT)
Received: (qmail 311064 invoked by uid 1000); 3 Jun 2022 15:37:44 -0400
Date:   Fri, 3 Jun 2022 15:37:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3] usb: hub: port: add sysfs entry to switch port power
Message-ID: <YppjCCJrtxc4lEGc@rowland.harvard.edu>
References: <20220603115222.2151283-1-m.grzeschik@pengutronix.de>
 <YpovuqKtQBKQoVos@rowland.harvard.edu>
 <20220603172209.GD26638@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603172209.GD26638@pengutronix.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 03, 2022 at 07:22:09PM +0200, Michael Grzeschik wrote:
> On Fri, Jun 03, 2022 at 11:58:50AM -0400, Alan Stern wrote:
> > On Fri, Jun 03, 2022 at 01:52:22PM +0200, Michael Grzeschik wrote:

> > > +static ssize_t disable_show(struct device *dev,
> > > +			      struct device_attribute *attr, char *buf)
> > > +{
> > > +	struct usb_port *port_dev = to_usb_port(dev);
> > > +	struct usb_device *hdev = to_usb_device(dev->parent->parent);
> > > +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> > > +	int port1 = port_dev->portnum;
> > > +	bool state = test_bit(port1, hub->power_bits);
> > > +
> > > +	return sprintf(buf, "%s\n", state ? "0" : "1");
> > 
> > Maybe "false" and "true" instead of "0" and "1"?
> 
> I prefer 0 and 1 since we also feed this to the file.

Oops -- I was wrong about "true" or "false" (which is a little odd; 
you'd think a parser for boolean values would certainly recognize those 
words).  However, strtobool() does also recognize "yes", "no", "on", and 
"off".

Using "on" and "off" would lead to confusion, since "on" means 
"disable is turned on", which means the port is off!  "Yes" and "no" 
would be okay, though.

> Also, I just found out that just parsing power_bits is not enough.
> 
> E.g. when we use other tools to set clear PORT_POWER on the hub like
> uhubctl to disable a port. The value does not represent the real state
> of the port.

The value in power_bits is always supposed to match the real state of 
the port.  How does uhubctl manage to get them to disagree?

> I think it is better to use hub_port_status and port_is_power_on from
> hub.c to test the real state by sending a GET_STATUS command.

Maybe.  But if power_bits is working properly, this should not be 
needed.  It would be better to fix the value stored in power_bits.

Alan Stern

> For this, the functions need to be unset static and exported via hub.h.
> 
> I will add this in v4.

