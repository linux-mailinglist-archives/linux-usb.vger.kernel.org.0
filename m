Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBB04CD6AE
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 15:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbiCDOqF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 09:46:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbiCDOqE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 09:46:04 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B1148384
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 06:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=XTUOml8D8jZQuiwcRWaVPWFzFJev/to0oiZafMqVQA0=; b=W8kDW3moLbIsxUUT92vvc8N037
        C2K3N5Ke1M83If9IyycT6zCywcWDh6iRBLZewo+rs6F+r+0HuKN+K0PifblJ1drwime2YyECva3I3
        DMEv4JyyBN35WmQvLgNbs2G1mudXz5GFkE/9TUBYc0Dp2qUCRyIAthoghhiocpjaaKy8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1nQ9B8-009F97-4V; Fri, 04 Mar 2022 15:45:10 +0100
Date:   Fri, 4 Mar 2022 15:45:10 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Martyn Welch <martyn.welch@collabora.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Marek Vasut <marex@denx.de>,
        USB list <linux-usb@vger.kernel.org>, oneukum@suse.com,
        Adam Ford <aford173@gmail.com>, peter.chen@kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        fntoth@gmail.com
Subject: Re: smsc9511: Register access happens after unregistration
Message-ID: <YiIl9nDEoPapfytn@lunn.ch>
References: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
 <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com>
 <YiIeEHMc+tWE0coi@lunn.ch>
 <8412ed8895e8ef59d4a1789635b670f21601a6c4.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8412ed8895e8ef59d4a1789635b670f21601a6c4.camel@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > I suggest you look at the call sequences. When does phy_stop() and
> > phy_disconnect() get called? phylib has a work queue which runs once
> > per second to poll the PHY and get its status. That polling is
> > stopped
> > by calling phy_stop(). It is also assumed you can still talk to the
> > PHY while performing phy_stop().
> > 
> > 
> 
> I was just trying to remember the details from when I looked at this
> driver. IIRC, that's broadly the conclusion I came to and couldn't
> really see a way around it. Access to the phy was being lost before
> phy_stop() was called.

This i don't really understand. This is a reboot(1), so a controlled
shutdown. Why is access being lost to the PHY? A hot unplug you cannot
do anything about, but this is not the case here.

      Andrew
