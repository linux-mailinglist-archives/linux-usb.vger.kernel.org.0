Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889D61CE213
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 19:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730115AbgEKR5W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 13:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727051AbgEKR5W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 13:57:22 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3104C05BD09
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 10:57:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x10so4248714plr.4
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 10:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/4VPW/3YLXwoqcjHvmu+U93vY1XvtT8ILR97l+aBRHM=;
        b=XYsodElimbqFJLNFnU/6UJl3lwNcwYu/y1MR1mjVNPFY94eInf7JUE6nLmVgUkHowr
         4zSTdezoG0smW1qmL27QUdfb65KUD5AuCFfMJHnfOwzRVwH5uwUY2BPnP2uILCu+GQY0
         PICJ13i5ZMC1iPneXD+vBuFAGy2Rk3JBqX/2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/4VPW/3YLXwoqcjHvmu+U93vY1XvtT8ILR97l+aBRHM=;
        b=J9AmoCgaQeECv6aWMf6tl0Z8Iw4pdEIHVRzCRfyHRUgKVygC2AhXraJlIu+gYYulb7
         48nRCSos+/ld6/SeVXjrYVNSqqTrwDiPyZGL7V7dPNw1fXjJcHGiAzKk7qgWNMAkiIuV
         RjZgvl3rr8XqpFldrpQOk4d5BkOSjmBBNV4RysGReU4h/s+gaBdfcHTkDdN/QzC94GlS
         G+2IMYZPOwDaRJJllJiFxLDPr53LScmVxCDHYcPbOCAkxxC8RcQcrdZHqnnr1QMBpa3H
         808Zl18aIHHJPkdzECVu8GzeSwy/FYMQLUXbBE2brYmNkWqA3pUu2XDnTL6AXzV8Yx1/
         nWcg==
X-Gm-Message-State: AGi0PuYgT0YeBzzmLkh+Mh+z8A5kyPniv2ZvHfH8Ld9ZewGKX4CHBM8+
        cjvcFyJDCrNYcD+sK/j9uMgBXA==
X-Google-Smtp-Source: APiQypKPWCdtCZVF1JVQ+N/i5CTxy1YZ2uxgAQ2wkunQWyauVm+9tyh+T7jrBtoR7DjFIZl3sskrPw==
X-Received: by 2002:a17:90a:1b67:: with SMTP id q94mr23611499pjq.84.1589219841106;
        Mon, 11 May 2020 10:57:21 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id z190sm9750203pfz.84.2020.05.11.10.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 10:57:20 -0700 (PDT)
Date:   Mon, 11 May 2020 10:57:19 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: mux: intel_pmc_mux: Support for static
 SBU/HSL orientation
Message-ID: <20200511175719.GA136540@google.com>
References: <20200507150900.12102-1-heikki.krogerus@linux.intel.com>
 <20200507150900.12102-3-heikki.krogerus@linux.intel.com>
 <20200507224041.GA247416@google.com>
 <20200508111840.GG645261@kuha.fi.intel.com>
 <20200511133202.GA2085641@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511133202.GA2085641@kuha.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Thanks a lot for looking into this. Kindly see my response inline:

On Mon, May 11, 2020 at 04:32:02PM +0300, Heikki Krogerus wrote:
> On Fri, May 08, 2020 at 02:18:44PM +0300, Heikki Krogerus wrote:
> > Hi Prashant,
> > 
> > On Thu, May 07, 2020 at 03:40:41PM -0700, Prashant Malani wrote:
> > > > +static int sbu_orientation(struct pmc_usb_port *port)
> > > > +{
> > > > +	if (port->sbu_orientation)
> > > > +		return port->sbu_orientation - 1;
> > > > +
> > > > +	return port->orientation - 1;
> > > > +}
> > > > +
> > > > +static int hsl_orientation(struct pmc_usb_port *port)
> > > > +{
> > > > +	if (port->hsl_orientation)
> > > > +		return port->hsl_orientation - 1;
> > > > +
> > > > +	return port->orientation - 1;
> > > > +}
> > > > +
> > > >  static int pmc_usb_command(struct pmc_usb_port *port, u8 *msg, u32 len)
> > > >  {
> > > >  	u8 response[4];
> > > > @@ -151,8 +170,9 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
> > > >  
> > > >  	req.mode_data = (port->orientation - 1) << PMC_USB_ALTMODE_ORI_SHIFT;
> > > >  	req.mode_data |= (port->role - 1) << PMC_USB_ALTMODE_UFP_SHIFT;
> > > > -	req.mode_data |= (port->orientation - 1) << PMC_USB_ALTMODE_ORI_AUX_SHIFT;
> > > > -	req.mode_data |= (port->orientation - 1) << PMC_USB_ALTMODE_ORI_HSL_SHIFT;
> > > > +
> > > > +	req.mode_data |= sbu_orientation(port) << PMC_USB_ALTMODE_ORI_AUX_SHIFT;
> > > 
> > > I'm curious to know what would happen when sbu-orientation == "normal".
> > > That means |port->sbu_orientation| == 1.
> > > 
> > > It sounds like what should happen is the AUX_SHIFT orientation
> > > setting should follow what |port->orientation| is, but here it
> > > looks like it will always be set to |port->sbu_orientation - 1|, i.e 0,
> > > even if port->orientation == TYPEC_ORIENTATION_REVERSE, i.e 2, meaning
> > > it should be set to 1 ?
> > 
> > I'll double check this, and get back to you..
> 
> This is not exactly an answer to your question, but it seems that
> those bits are only valid if "Alternate-Direct" message is used.
> Currently the driver does not support that message.
Could you kindly provide some detail on when "Alternate-Direct" would be
preferred to the current method?
Also, is there anything on the PMC side which is preventing the use of
"Alternate-Direct" messages? It seems like the state transition diagram
there would be simpler, although I'm likely missing significant details
here.

> 
> I think the correct thing to do now is to remove the two lines from
> the driver where those bits (ORI-HSL and ORI-Aux) are set.
I see. How would orientation then be handled in a retimer configuration
where AUX/SBU is flipped by the retimer itself?

Best regards,

-Prashant
> 
> Let me know if that's OK, and I'll update the series.
> 
> thanks,
> 
> -- 
> heikki
