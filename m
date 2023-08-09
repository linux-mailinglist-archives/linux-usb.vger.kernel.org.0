Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C1F776210
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 16:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbjHIOIX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 10:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjHIOIW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 10:08:22 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A55AE1FC2
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 07:08:21 -0700 (PDT)
Received: (qmail 197500 invoked by uid 1000); 9 Aug 2023 10:08:20 -0400
Date:   Wed, 9 Aug 2023 10:08:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     peter.chen@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 1/2] usb: ehci: add workaround for chipidea PORTSC.PEC
 bug
Message-ID: <2818b495-a0ce-43e7-9922-6345cfb06242@rowland.harvard.edu>
References: <20230809024432.535160-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809024432.535160-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 09, 2023 at 10:44:31AM +0800, Xu Yang wrote:
> Some NXP processor using chipidea IP has a bug when frame babble is
> detected.
> 
> As per 4.15.1.1.1 Serial Bus Babble:
>   A babble condition also exists if IN transaction is in progress at
> High-speed SOF2 point. This is called frame babble. The host controller
> must disable the port to which the frame babble is detected.
> 
> The USB controller has disabled the port (PE cleared) and has asserted
> USBERRINT when frame babble is detected, but PEC is not asserted.
> Therefore, the SW isn't aware that port has been disabled. Then the
> SW keeps sending packets to this port, but all of the transfers will
> fail.
> 
> This workaround will firstly assert PCD by SW when USBERRINT is detected
> and then judge whether port change has really occurred or not by polling
> roothub status. Because the PEC doesn't get asserted in our case, this
> patch will also assert it by SW when specific conditions are satisfied.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - fix typo in commit message
>  - Adjust the judgement logic in echi_irq() as suggested from Alan
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
