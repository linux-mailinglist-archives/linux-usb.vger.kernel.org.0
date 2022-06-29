Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2DD55FD09
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 12:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbiF2KVA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 06:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbiF2KU7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 06:20:59 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8360F2CDEA
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 03:20:57 -0700 (PDT)
Date:   Wed, 29 Jun 2022 20:20:47 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
        t=1656498055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WjcGeJFro2EiGRKcIX4snppxmD4eF5HXiDEKexHP+yY=;
        b=kSBRLyelY2cd3rVGqFbRjRNh8KitJBGLaRlZAL6DpSRRMB4aYCMQTZD9QNfTtiCL5KfyHM
        1S08HASIaxHrDt5Cj5aC/9Tm8bYgOa8t82LIuNX2CIhbEPCy7RFNuJ7n5pBpL0ucdWxpEo
        wjKXyC6rzO2PpbLXhjRHMtgAYMd3ncjcWY+adf2sX7GA4do/E8hvtI1iQ+tPFDxukKVprP
        2fKtAQqoyBsUTWae6B0yv2Q2vIAQWnpG+wo93oTUccx+Mb/aq2MpdbdRq6EN4MGq9xuSed
        eAqkOIqsazP9ZDOWNVHAuxqIYQjsQ/bR+PLNHtijNAcLAdTh4/Z6Z/PjUS3t9Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jookia <contact@jookia.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: acm_port_shutdown hangs for 30 seconds
Message-ID: <Yrwnf8tR5CC53u2p@novena-choice-citizen>
References: <YiynBKeGJCMEkgyO@novena-choice-citizen>
 <YrmpLXcPeHW4fnvz@kroah.com>
 <YrrILGzC2R3qGiHu@novena-choice-citizen>
 <YrwPY0faDmVcjTqx@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrwPY0faDmVcjTqx@kroah.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: jookia.org
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 29, 2022 at 10:37:55AM +0200, Greg KH wrote:
> The close is timing out as it tries to flush the data to the device
> which is no longer responding.  So this kind of is expected behavior,
> sorry.

That makes sense. I'm guessing that changing this behaviour to be
asynchronous would break applications that rely on the return code from
close() to say EIO if it does that.

> 
> greg k-h

Jookia.
