Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C35704EDD
	for <lists+linux-usb@lfdr.de>; Tue, 16 May 2023 15:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbjEPNLZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 May 2023 09:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbjEPNLY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 May 2023 09:11:24 -0400
X-Greylist: delayed 531 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 16 May 2023 06:11:19 PDT
Received: from out-21.mta1.migadu.com (out-21.mta1.migadu.com [95.215.58.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB54BD
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 06:11:19 -0700 (PDT)
Date:   Tue, 16 May 2023 15:02:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1684242137;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5RkRIPsNe+UkepsgIzrFGBIrxo6yPzHDz/2XXGlIhIo=;
        b=d8qjHfW7llB0ixZN79xz8yx+Z+1o/jBrAIVvRiJJbC4pQzpVETmM8kQOMlnPmj3FOo5BNC
        ZnieojWHpX7GTMkNhED6p4VMYWqVNmaHgokrzxnQDZKAhEaCmk6upCFHpkCZ2lVWzhyUVJ
        5kBtrWHYQtVYJ8S3zxlfn5W9QIS6ZCM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Richard Leitner <richard.leitner@linux.dev>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marek Vasut <marex@denx.de>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mike.looijmans@topic.nl
Subject: Re: [PATCH v2] dt-bindings: usb: usb251xb: correct swap-dx-lanes
 type to uint32
Message-ID: <20230516130214.GA366790@g0hl1n.net>
References: <20230516083432.18579-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516083432.18579-1-krzysztof.kozlowski@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 16, 2023 at 10:34:32AM +0200, Krzysztof Kozlowski wrote:
> The "swap-dx-lanes" was never described as uint8 in original TXT
> bindings and Linux driver expects uint32.  Fix the type to match Linux
> driver expectation.
> 
> Fixes: fff61d4ccf3d ("dt-bindings: usb: usb251xb: Convert to YAML schema")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

LGTM. Please feel free to add

Reviewed-by: Richard Leitner <richard.leitner@linux.dev>
