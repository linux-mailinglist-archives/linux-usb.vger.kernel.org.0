Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE9E162F967
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 16:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242371AbiKRPgj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 10:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242406AbiKRPgc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 10:36:32 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9FE9877205
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 07:36:26 -0800 (PST)
Received: (qmail 39511 invoked by uid 1000); 18 Nov 2022 10:36:25 -0500
Date:   Fri, 18 Nov 2022 10:36:25 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] Documentation: USB: correct possessive "its" usage
Message-ID: <Y3emeeetkgcGxNAO@rowland.harvard.edu>
References: <20221118034331.18188-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118034331.18188-1-rdunlap@infradead.org>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 17, 2022 at 07:43:31PM -0800, Randy Dunlap wrote:
> Correct uses of "it's" to possessive "its" as needed.
> Correct associated grammar in one location.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
>  Documentation/usb/CREDITS          |    4 ++--
>  Documentation/usb/functionfs.rst   |    2 +-
>  Documentation/usb/gadget_multi.rst |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff -- a/Documentation/usb/CREDITS b/Documentation/usb/CREDITS
> --- a/Documentation/usb/CREDITS
> +++ b/Documentation/usb/CREDITS
> @@ -126,7 +126,7 @@ THANKS file in Inaky's driver):
>          - Jochen Karrer <karrer@wpfd25.physik.uni-wuerzburg.de>, for
>            pointing out mortal bugs and giving advice.
>  
> -        - Edmund Humemberger <ed@atnet.at>, for it's great work on
> +        - Edmund Humemberger <ed@atnet.at>, for its great work on
>            public relationships and general management stuff for the
>            Linux-USB effort.
>  
> @@ -136,7 +136,7 @@ THANKS file in Inaky's driver):
>          - Ric Klaren <ia_ric@cs.utwente.nl> for doing nice
>            introductory documents (competing with Alberto's :).
>  
> -        - Christian Groessler <cpg@aladdin.de>, for it's help on those
> +        - Christian Groessler <cpg@aladdin.de>, for its help on those
>            itchy bits ... :)
>  

Shouldn't this pronoun and the one above really be "his" rather than 
either "it's" or "its"?

Alan Stern

>          - Paul MacKerras for polishing OHCI and pushing me harder for
> diff -- a/Documentation/usb/functionfs.rst b/Documentation/usb/functionfs.rst
> --- a/Documentation/usb/functionfs.rst
> +++ b/Documentation/usb/functionfs.rst
> @@ -49,7 +49,7 @@ level it would look like this::
>    $ ( cd /dev/ffs-hid && hid-daemon ) &
>  
>  On kernel level the gadget checks ffs_data->dev_name to identify
> -whether it's FunctionFS designed for MTP ("mtp") or HID ("hid").
> +whether its FunctionFS is designed for MTP ("mtp") or HID ("hid").
>  
>  If no "functions" module parameters is supplied, the driver accepts
>  just one function with any name.
> diff -- a/Documentation/usb/gadget_multi.rst b/Documentation/usb/gadget_multi.rst
> --- a/Documentation/usb/gadget_multi.rst
> +++ b/Documentation/usb/gadget_multi.rst
> @@ -9,7 +9,7 @@ The Multifunction Composite Gadget (or g
>  that makes extensive use of the composite framework to provide
>  a... multifunction gadget.
>  
> -In it's standard configuration it provides a single USB configuration
> +In its standard configuration it provides a single USB configuration
>  with RNDIS[1] (that is Ethernet), USB CDC[2] ACM (that is serial) and
>  USB Mass Storage functions.
>  
