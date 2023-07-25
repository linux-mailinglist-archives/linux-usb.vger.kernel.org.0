Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82A767619DF
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jul 2023 15:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbjGYNZ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jul 2023 09:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjGYNZy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 09:25:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03AD919A1;
        Tue, 25 Jul 2023 06:25:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8CB3061712;
        Tue, 25 Jul 2023 13:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA3DC433C7;
        Tue, 25 Jul 2023 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690291542;
        bh=eq/sAk3XnY2BUMi0zxYt2IY3u9cP4JXcT5gYpeynge8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=caEQSWNzqVuQhJTPAzNc4/R0Fp2WU5lC29zIHvzVWG25x5VAHlUrFNnvB//drNiVe
         /0pXcBWGLzlZ2cTKhESbPPU3ifb18Jt4lyYeK2ajV+w8tWS+CsjKJoq8Nz8hM3k9YD
         Mm1vq1B/DsWPOPl83fK6wBRtgHffULCuQD9jd8k8=
Date:   Tue, 25 Jul 2023 15:25:39 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     adrian.ho.yin.ng@intel.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        p.zabel@pengutronix.de
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
Message-ID: <2023072554-usage-untrimmed-409b@gregkh>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 24, 2023 at 02:36:58PM +0800, adrian.ho.yin.ng@intel.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> 
> Existing binding intel,keembay-dwc3.yaml does not have the required
> properties for Intel SoCFPGA devices.
> Introduce new binding description for Intel SoCFPGA USB controller
> which will be used for current and future SoCFPGA devices.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> ---
>  .../bindings/usb/intel,socfpga-dwc3.yaml      | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml

You don't seem to have followed the rules that your employer has for
kernel contributions, so we can't take this, sorry.  Please work with
the Intel Linux kernel group to resolve those issues first, and then
resubmit the patches properly.

thanks,

greg k-h
