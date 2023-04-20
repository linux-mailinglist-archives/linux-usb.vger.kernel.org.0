Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6096E8760
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 03:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjDTBUy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 21:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjDTBUx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 21:20:53 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B1A1D49FD
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 18:20:41 -0700 (PDT)
Received: (qmail 481181 invoked by uid 1000); 19 Apr 2023 21:20:40 -0400
Date:   Wed, 19 Apr 2023 21:20:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Avichal Rakesh <arakesh@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala \(Eddy\)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Message-ID: <857134d6-1537-4879-9c1e-b7067d0fdeb3@rowland.harvard.edu>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230419214931.ckjgowyqyzqs2x4j@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419214931.ckjgowyqyzqs2x4j@synopsys.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 19, 2023 at 09:49:35PM +0000, Thinh Nguyen wrote:
> By the usb spec, for IN direction, if there's no data available and the
> host requests for data, then the device will send a zero-length data
> packet.

I'm not aware of any such requirement in the USB-2 spec.  The closest I 
can find is in section 5.6.4:

	An isochronous IN endpoint must return a zero-length packet 
	whenever data is requested at a faster interval than the 
	specified interval and data is not available.

But this specifically refers only to situations where the host asks for 
isochonous data more frequently than the endpoint descriptor's bInterval 
describes.

>  This is what the dwc3 controller will do. So regardless whether
> you prepare and queue a 0-length request or not, the host will receive
> it.

Even so, whether the function driver submits these 0-length isochronous 
requests makes a difference in terms of filling the slots in the 
schedule and preventing later requests from becoming stale.

Alan Stern
