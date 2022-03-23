Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85DA14E5138
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 12:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243857AbiCWLXN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 07:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243912AbiCWLXK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 07:23:10 -0400
Received: from fx304.security-mail.net (smtpout30.security-mail.net [85.31.212.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6757893C
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 04:21:38 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx304.security-mail.net (Postfix) with ESMTP id 0BEEE62AA5
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 12:21:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1648034497;
        bh=TNrKyXBPh5f/YqAT7lRVAVs2VRFDa1xOZDAWA3sXRIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=x59frBbT2EeT8X7UM/gxtXdrK3r/ok7IMcf7xXQ0Wi4GRL89qHqfRn7uD7X3XPYGn
         JtvRoAJfTeUsDDzXkL4wiE96JpNiZ3RC6XVEaUNh84jasiBXC98dC3VDkko8NqsX/u
         OKLe9gqRwK4/ExvIDuHxxtqnYjWZpKvA3oL11FdI=
Received: from fx304 (localhost [127.0.0.1]) by fx304.security-mail.net
 (Postfix) with ESMTP id F356062A10; Wed, 23 Mar 2022 12:21:35 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx304.security-mail.net (Postfix) with ESMTPS id 5DCF762AA4; Wed, 23 Mar
 2022 12:21:35 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 3B73927E0425; Wed, 23 Mar 2022
 12:21:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 222D727E0443; Wed, 23 Mar 2022 12:21:35 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 zr4ofH7grnVk; Wed, 23 Mar 2022 12:21:35 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 0929D27E0425; Wed, 23 Mar 2022
 12:21:35 +0100 (CET)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <cacc.623b02bf.5bd61.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 222D727E0443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1648034495;
 bh=/jeWtoyaCWmsCo82IQBTJurOJ/Gc5RM8Gtt7W2eNWsI=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=T/9EZ7dQgVF0U8EMtQBFbOZzukqSUgRhLkxkYEfM+kCKdLK+IJ5VnEMutVtaQaCpj
 9CGy5FTy6oNwvdAABC2i4snzy5wAdj9XFJ2lHaIWvz7R5UhiaxWTD8AEOBvH14wP+B
 bjp08ul+ycF/FewJPbR6RmYbPIslIi6oHdXv7aQk=
Date:   Wed, 23 Mar 2022 12:21:33 +0100
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] phy: core: Warn when phy_power_on is called
 before phy_init
Message-ID: <20220323112133.GA4351@tellis.lin.mbt.kalray.eu>
References: <20220323110708.8254-1-jmaselbas@kalray.eu>
 <20220323110708.8254-4-jmaselbas@kalray.eu>
 <1dba9024-6c48-03da-5d1e-70c05a87c4a8@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1dba9024-6c48-03da-5d1e-70c05a87c4a8@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ahmad,

On Wed, Mar 23, 2022 at 12:13:42PM +0100, Ahmad Fatoum wrote:
> Hello Jules,
> 
> On 23.03.22 12:07, Jules Maselbas wrote:
> > A warning when the order of phy operation is mixed up by drivers,
> > this is an atempt to make the phy usage more uniform across (usb)
> > drivers.
> 
> Thanks for picking up this suggestion.
> 
> > Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> > Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
> > Cc: Minas Harutyunyan <hminas@synopsys.com>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > ---
> > change in v2:
> >   - no changes
> > 
> >  drivers/phy/phy-core.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index cbdad65d2caa..0cb4da62577e 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -252,6 +252,9 @@ int phy_init(struct phy *phy)
> >  		return ret;
> >  	ret = 0; /* Override possible ret == -ENOTSUPP */
> >  
> > +	if (phy->power_count > phy->init_count)
> 
> This needs to be moved into the critical section below.
yes, you're right, I'll send a v3 later, giving some time for other
people to comment.

> 
> > +		dev_warn(&phy->dev, "phy_power_on was called before phy_init\n");
> 
> I am wondering how often would this be triggered for e.g. a PHY that's being
> runtime suspended. But the warning being obnoxious is the point of the patch,
> so perhaps it's ok to not make it into a dev_warn_once. 
I don't really know how often this will be printed, this is an open point.

> 
> > +
> >  	mutex_lock(&phy->mutex);
> >  	if (phy->init_count == 0 && phy->ops->init) {
> >  		ret = phy->ops->init(phy);
> 
> 




