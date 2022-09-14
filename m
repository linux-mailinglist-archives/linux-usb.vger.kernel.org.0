Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1A35B84F6
	for <lists+linux-usb@lfdr.de>; Wed, 14 Sep 2022 11:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiINJ3g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Sep 2022 05:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiINJ3P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Sep 2022 05:29:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6EC78BD2
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 02:18:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3EB57B81886
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 09:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D911BC433C1;
        Wed, 14 Sep 2022 09:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663147082;
        bh=O5XIFSrgw9E6spBPZw8KLnUqEQRol6//4Z0QQfBpfvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KkBTVPgcpH5XnonfRRRdoDtadaQpVXYfQuN6D3omd4NrotqpfGqOp0a1Gieeps1fE
         Hl43OPHgdtUIcv2u/N8pTRMbIrNGzjO+mEW+wf06lcU/lUX+eRtWJ3I4MouwehpqqT
         bHaDivTGqDjsrtJlwl9tSVgdsKDLSKs2TD5ObDuSGI84y5L1OugUs81QZVOutTZxje
         qOgt3N3lgSjSRuqweyoZbkQ2snB0LQYUbpWV1qimFK3PRBgvbWp41jqylb+eCAA6ta
         oj2Jwo/6yeOd53NIK97T1RBJtOsSYG/bi2miRdlZb+WW0PuXZUD8O1oAKjBmWlmkVG
         +lf3kUeo3cqbw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oYOWx-0001EP-9C; Wed, 14 Sep 2022 11:18:04 +0200
Date:   Wed, 14 Sep 2022 11:18:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/7] USB: serial: ftdi_sio: Fix custom_divisor and
 c_*speed for ASYNC_SPD_CUST
Message-ID: <YyGcS/DwPtN5qnmm@hovoldconsulting.com>
References: <Yt06+wicNYMt/D7f@hovoldconsulting.com>
 <20220724123351.icqqvvfxjm7ogo5u@pali>
 <Yt1BIsPqAVH0ajlf@hovoldconsulting.com>
 <20220724125908.6vu3jveiaisvpocb@pali>
 <Yt1EOcRWi0LdKqrB@hovoldconsulting.com>
 <20220818140952.r4c3plso4mm5s7jb@pali>
 <YyCayj7H/3My2amz@hovoldconsulting.com>
 <20220914084831.wboticmzy33guzam@pali>
 <YyGXyGvmAD4G1h2b@hovoldconsulting.com>
 <20220914091006.bltnzb4gmwomc3yo@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220914091006.bltnzb4gmwomc3yo@pali>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 14, 2022 at 11:10:06AM +0200, Pali Rohár wrote:
> On Wednesday 14 September 2022 10:58:48 Johan Hovold wrote:
> > On Wed, Sep 14, 2022 at 10:48:31AM +0200, Pali Rohár wrote:

> > > Seems that you did not understand the point. So I will try to explain it
> > > again. This is not a new feature for _old_ ASYNC_SPD_CUST. This is the
> > > fix for the _new_ TCGETS2 API, to ensure that driver will always returns
> > > corrects values in c_*speed fields. If driver is not going to fix this
> > > _new_ TCGETS2 API then there is _NO_ point to use this new API in
> > > userspace and it is better to stick with the old ASYNC_SPD_CUST. And
> > > this is the current userspace state. So based on your input, it is the
> > > time to deprecate TCGETS2?
> > 
> > Stop being silly. As I've said repeatedly, we don't care about
> > ASYNC_SPD_CUST. Just return 38400 regardless of whatever magic happens
> > behind the scenes with the TIOCSSERIAL ioctl.

> I'm not silly here. Look, those APIs are for userspace. And if userspace
> application cannot use this new TCGETS2 API (for more reasons) then they
> stick with the old one TIOCSSERIAL. And your inputs just say that it is
> not a good idea to switch TCGETS2 as this API stay broken in some
> drivers. Silly is the one who do not see (or do not want to see it;
> because of own API perfectionism) the reasons why new "proposed API" is
> still not (widely) used and applications stick with TCGETS + TIOCSSERIAL.
> 
> That is why I'm asking, it is time to starting deprecating TCGETS2 and
> create for example TCGETS3? Only just few application use TCGETS2, so
> deprecation of TCGETS2 can be done _now_ without pain as this API is not
> widely used.

You're trying to keep the ASYNC_SPD hack alive by forcing drivers to
take it into consideration for TCGETS2. Just stop using the former and
switch to using BOTHER. And if something is missing in user space for
that, then fix that.

Johan
