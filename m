Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6BD7297DD
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 13:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239471AbjFILJv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 07:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239166AbjFILJX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 07:09:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1002C2737
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 04:09:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9B58656DE
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 11:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9307AC433EF;
        Fri,  9 Jun 2023 11:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686308962;
        bh=UtE2ojfq4pTGAnMSeMjcwz21FgB8hzLm4sDSgC0mL/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i27069RQ6hDxiL+hM97+VFg3JTP2OqE8fBDTccIS9s0C6/FGfkYrhRkdNPlkr0LhV
         T4LdK8B1KrotH05e15zDckSyEuhmSMSzu/bzb9OIKKhj2miL9xfBHQUDMcA5h68GPv
         siaiD83SQTwMU8OcYrgFZUNbNhVRRqEc880q+2qs=
Date:   Fri, 9 Jun 2023 13:09:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     George Valkov <gvalkov@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Foster Snowhill <forst@pen.gy>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        patchwork-bot+netdevbpf@kernel.org,
        Simon Horman <simon.horman@corigine.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Netdev List <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next v4 1/4] usbnet: ipheth: fix risk of NULL pointer
 deallocation
Message-ID: <2023060907-matted-dorsal-af5e@gregkh>
References: <20230607135702.32679-1-forst@pen.gy>
 <168630302068.8448.16788889957368567496.git-patchwork-notify@kernel.org>
 <07CBE5ED-2569-450D-975A-64B5670D6928@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07CBE5ED-2569-450D-975A-64B5670D6928@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 09, 2023 at 01:42:09PM +0300, George Valkov wrote:
> Thank you David!
> 
> Can you please also backport the patch-series to Linux kernel 5.15, which is in use by the OpenWRT project! The patches apply cleanly.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
