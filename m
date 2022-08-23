Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72C8E59E8AE
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 19:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343698AbiHWRLq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 13:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344048AbiHWRKG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 13:10:06 -0400
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A54087693
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 07:02:18 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id CAF88100B54CE;
        Tue, 23 Aug 2022 16:02:16 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id A36F636622; Tue, 23 Aug 2022 16:02:16 +0200 (CEST)
Date:   Tue, 23 Aug 2022 16:02:16 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 3/4] thunderbolt: Add helpers to check if CL states are
 enabled on port
Message-ID: <20220823140216.GA28421@wunner.de>
References: <20220823105352.56306-1-mika.westerberg@linux.intel.com>
 <20220823105352.56306-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823105352.56306-4-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 23, 2022 at 01:53:51PM +0300, Mika Westerberg wrote:
> +/**
> + * tb_port_is_clx_enabled() - Is given CL state enabled
> + * @port: USB4 port to check
> + * @clx: CL state to check
> + *
> + * Returns true if given CL state is enabled for @port.
> + */
> +bool tb_port_is_clx_enabled(struct tb_port *port, enum tb_clx clx)
> +{
> +	u32 phy, mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
> +	int ret;
> +
> +	if (!tb_port_clx_supported(port, clx))
> +		return false;
> +
> +	ret = tb_port_read(port, &phy, TB_CFG_PORT,
> +			   port->cap_phy + LANE_ADP_CS_1, 1);
> +	if (ret)
> +		return false;
> +
> +	return (phy & mask) == mask;
> +}
> +
[...]
> +static inline bool tb_port_are_clx_enabled(struct tb_port *port)
> +{
> +	return tb_port_is_clx_enabled(port, TB_CL1) ||
> +	       tb_port_is_clx_enabled(port, TB_CL2);
> +}

If you change enum tb_clx to use "power of two" values (0 1 2 4 8 ...)
then you could just pass a bitmask to tb_port_is_clx_enabled()
and thus need only a single invocation in tb_port_are_clx_enabled().
Just a thought.

Thanks,

Lukas
