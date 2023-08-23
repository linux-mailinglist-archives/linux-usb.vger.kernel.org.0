Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3FF785C2F
	for <lists+linux-usb@lfdr.de>; Wed, 23 Aug 2023 17:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbjHWPfH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Aug 2023 11:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbjHWPfG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Aug 2023 11:35:06 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D4FDE4E
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 08:35:04 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68a402c1fcdso2549330b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692804904; x=1693409704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=07Mce2G1b7jZbatYr8l4g8OrNA5u0GIrzsapzWVE+qk=;
        b=nw9oh7b2KjmuRReJhcgYE293WQN0lQS+JMtFeKcJZKCS3LsY3rbr6Gw5fj76iDKPTL
         wjoKkcN9ax6fncNVFl3fiIeWMj0K/gGxSGGigUYAFUNOnBATklm8t2iBitnytM4EBNpD
         6uWLHu02+eKbpJ9mXHWzWGdAmy2RXbxogVja8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692804904; x=1693409704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07Mce2G1b7jZbatYr8l4g8OrNA5u0GIrzsapzWVE+qk=;
        b=bK2/fIvx8ogP+znrSNYdR7h5EKhf2xiE2cKXa4zCjiKqtKYZ5RIxSEO3z/1uNjTfsK
         kcaqTSnn459igxtaYXr4sliPW/YKWuBbg5L7taYywgE4yc22FkBkETnTwr1oi8vc21Gd
         +kBHQ1OVhFjDgW0MgT3qy4R0ZHsNtVx8uM3UythHlQrTFb14uyca4pbENPdnQyZU10tq
         wtDfISokdez8+b623MqvKFOfj/bt9LirWEkWnr7zGBRUwk4tWkq5r6EPJSixXAcYL+DE
         M/5DCjY2SCxzAsBF30EDvTXTu6LpOc8iR0biBayOGR4UO9yZD3TuH6qnOHgCmU9sD5Hv
         Yf9w==
X-Gm-Message-State: AOJu0YxfIk3pPaKuc3f1IN1tjSP17UtwEYVtYlqBLChEW74dQXHq3jK4
        29lBX5NlgvO8uhUzsfhT3KASrg==
X-Google-Smtp-Source: AGHT+IFkfcfb94Hu56gn2/sqah/fCojupbSHzlxEt5JvjNyiB0KDOREoW+DVi51oV/njGmCoUTmFdw==
X-Received: by 2002:a05:6a20:4417:b0:140:54ab:7f43 with SMTP id ce23-20020a056a20441700b0014054ab7f43mr13291414pzb.52.1692804903757;
        Wed, 23 Aug 2023 08:35:03 -0700 (PDT)
Received: from chromium.org (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id v14-20020a62a50e000000b0068702b66ab1sm9940846pfm.174.2023.08.23.08.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 08:35:03 -0700 (PDT)
Date:   Wed, 23 Aug 2023 15:35:01 +0000
From:   Prashant Malani <pmalani@chromium.org>
To:     "Patel, Utkarsh H" <utkarsh.h.patel@intel.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "bleung@chromium.org" <bleung@chromium.org>
Subject: Re: [PATCH v4 1/2] platform/chrome: cros_ec_typec: Configure Retimer
 cable type
Message-ID: <ZOYnJTqTajyyJV0d@chromium.org>
References: <20230718024703.1013367-1-utkarsh.h.patel@intel.com>
 <20230718024703.1013367-2-utkarsh.h.patel@intel.com>
 <ZN+j/z97Yy0wv/if@chromium.org>
 <MWHPR11MB0048DAF02954ACC66C026533A91EA@MWHPR11MB0048.namprd11.prod.outlook.com>
 <CACeCKacWhrZE6LFFwF=vDO8362u9feN71pPO8Qr8XoaRgwj5uw@mail.gmail.com>
 <MWHPR11MB0048018BB93C531401D00EF9A91FA@MWHPR11MB0048.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR11MB0048018BB93C531401D00EF9A91FA@MWHPR11MB0048.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Utkarsh,

On Aug 22 21:21, Patel, Utkarsh H wrote:
> Hi Prashant,
> 
> > -----Original Message-----
> > From: Prashant Malani <pmalani@chromium.org>
> > Sent: Monday, August 21, 2023 4:31 PM
> > >
> > > We are only calling it once depending upon which mode we enter TBT Alt or
> > USB4.
> > 
> > There should only be 1 "call site" and that should be sufficient to grab the VDO
> > from the framework for all circumstances. Whether the other invocation
> > doesn't get called under certain circumstances isn't as relevant.
> 
> Are you suggesting something like this?
> 
> static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,)...
> 
> 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED ||
> 		port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED)
> 		cable_tbt_vdo = cros_typec_get_cable_vdo(port, USB_TYPEC_TBT_SID);

My apologies, I misread the patch. I think this looks good.

Acked-by: Prashant Malani <pmalani@chromium.org>

