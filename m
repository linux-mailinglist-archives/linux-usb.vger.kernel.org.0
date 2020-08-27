Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A11254D13
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 20:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgH0S3V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 14:29:21 -0400
Received: from cmta16.telus.net ([209.171.16.89]:34079 "EHLO cmta16.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgH0S3S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 14:29:18 -0400
Received: from montezuma.home ([154.5.226.127])
        by cmsmtp with SMTP
        id BMeBkaDVD5b7lBMeCkx527; Thu, 27 Aug 2020 12:29:17 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=YPHhNiOx c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=kj9zAlcOel0A:10 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10
 a=9zCAL_U05XLBXZ4j-FYA:9 a=feVxBBcy3RB2p4HM:21 a=qMQBSIkd6cX3eIpC:21
 a=CjuIK1q_8ugA:10
Date:   Thu, 27 Aug 2020 11:29:15 -0700 (PDT)
From:   Zwane Mwaikambo <zwanem@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
In-Reply-To: <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org>
Message-ID: <alpine.DEB.2.21.2008271058220.37762@montezuma.home>
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home> <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CMAE-Envelope: MS4wfFEamT+yLQaWrXP2onHTP+/uvg/gfiK4hd3XhvbcZWph6muVOKIPcxbYgGExMBPj2zxpNHtuF7DJ+KwtsszVobnWYgWOcN6l+xab6f1on3bHrHMbkyTF
 g+DFs5qbq3UW1WPCsbzjGD39EreZEfXuRDUEhyN2JPR1il9JX2v9lHHJw8xdMRia1qDZYi6El0uLBR4q12eu3xx5cPRwIfBHzYHnxD5xDDltPiUEHcOas9KJ
 iM9FTJCEGg4dDDkBSUMUKYWALUDKyT4AuzxTGs4thfO8HezKx1YOtAaHu03XM+IkMRf0E9a8dIsDcwiPz1hCvA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 27 Aug 2020, Randy Dunlap wrote:

> On 8/27/20 10:49 AM, Zwane Mwaikambo wrote:
> > This v3 addresses patch formatting and submission issues with the 
> > previous versions.
> 
> That info goes after the "---" line.

Got it, i misunderstood Greg's comment.

> > con->partner_altmode[i] ends up with the value 0x2 in the call to 
> > typec_altmode_update_active because the array has been accessed out of 
> > bounds causing a random memory read.
> > 
> > This patch fixes the first occurence and 2/2 the second.
> 
> occurrence

Corrected

> > Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
> > ---
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index d0c63afaf..79061705e 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -218,9 +218,10 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
> >  	if (cur < UCSI_MAX_ALTMODES)
> >  		altmode = typec_altmode_get_partner(con->port_altmode[cur]);
> >  
> > -	for (i = 0; con->partner_altmode[i]; i++)
> > -		typec_altmode_update_active(con->partner_altmode[i],
> > -					    con->partner_altmode[i] == altmode);
> > +	for (i = 0; i < UCSI_MAX_ALTMODES; i++)
> > +		if (con->partner_altmode[i])
> > +			typec_altmode_update_active(con->partner_altmode[i],
> > +										con->partner_altmode[i] == altmode);
> 
> What happened to the indentation here?  Too much.

It was tabs to line up the parameters, i'll update it to just one 
indentation level from the function.

Thanks,
	Zwane
