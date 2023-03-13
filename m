Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6146B7BD2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 16:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjCMPWa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 11:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCMPW3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 11:22:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972BC6A2D1
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 08:22:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5A51AB81188
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 15:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2034EC433D2;
        Mon, 13 Mar 2023 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678720942;
        bh=SgFrapP2bFdFcTmehleZnYKPC7s8Q5haMs+R4Ehtado=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pXzUntZfjKmPDgbOY2DIKNJYR0/9gloQBOKBOWA6+3BAzzHQEo+NlVK5IfogUnryq
         V7IessxONqUAQeuvC7yJSppYM8kntKPjOuPPCkiyokjPNgFc1qART4OXTVq77a9qLo
         ATMvPAerpPtqzlkrDlRD1NIRY5DpaQLfgsCG25lPQ4dudjAJ/yi1XQ05MptRT5i9ny
         d4pHVDq+OArYf2gWOT3tsCfCV1zQu+SyqRPouDCwuz15Dlv1QAjBCPJWAG+Qr5p6IQ
         Iwq9O7lBIgC+8kE9tNAei6Nruz9qrh5VsSJVHnJOlMBotGesVvrMFMCNzdsy1sy4bv
         4ZM3rQhLBfIkw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pbk1D-0005cT-DH; Mon, 13 Mar 2023 16:23:23 +0100
Date:   Mon, 13 Mar 2023 16:23:23 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Kees Jan Koster <kjkoster@kjkoster.org>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cp210x: add Silicon Labs IFS-USB-DATACABLE
 IDs
Message-ID: <ZA8/678cjrgtzQ8B@hovoldconsulting.com>
References: <20230218141830.5612-1-kjkoster@kjkoster.org>
 <ZA87jMR8qx6YfBVQ@hovoldconsulting.com>
 <CC93BACA-B0D3-4D52-91AD-926AF894D3B6@kjkoster.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CC93BACA-B0D3-4D52-91AD-926AF894D3B6@kjkoster.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 13, 2023 at 04:07:39PM +0100, Kees Jan Koster wrote:
> Dear Johan,
> 
> Small celebration in my office. This was my first, official Linux Kernel patch.

Congratulations! Hope to see more of those in the future. :)

Johan
