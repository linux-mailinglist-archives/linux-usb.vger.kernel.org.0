Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E21D172CE96
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 20:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjFLSjT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 12 Jun 2023 14:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjFLSjS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 14:39:18 -0400
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40513189
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 11:39:17 -0700 (PDT)
Received: from [192.168.0.138] (ip-037-201-145-255.um10.pools.vodafone-ip.de [37.201.145.255])
        by voltaic.bi-co.net (Postfix) with ESMTPSA id 1ED032092E;
        Mon, 12 Jun 2023 20:39:15 +0200 (CEST)
Message-ID: <8fd6676257db2d5d54fbf0834e92d8f67d40d196.camel@bi-co.net>
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
From:   Michael =?ISO-8859-1?Q?La=DF?= <bevan@bi-co.net>
To:     Oliver Neukum <oneukum@suse.com>,
        Warren Togami <wtogami@gmail.com>, linux-usb@vger.kernel.org
Date:   Mon, 12 Jun 2023 20:39:14 +0200
In-Reply-To: <3d485cd9-e31c-20ac-e595-3000ada983fb@suse.com>
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
         <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
         <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
         <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
         <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
         <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
         <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
         <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
         <c93512db198b14ff8892102cfecec3bea8688aaf.camel@bi-co.net>
         <9f8df0d2-f2af-8e62-fe34-7d826678ac7e@suse.com>
         <b748359d-b116-6354-036c-94679bc7b306@gmail.com>
         <3d485cd9-e31c-20ac-e595-3000ada983fb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, dem 07.06.2023 um 15:10 +0200 schrieb Oliver Neukum:
> 
> Please test the attached patch by giving the new 'p' quirk
> as usbcore.quirks

Applying your patch on top of 6.3.7 and booting with
usbcore.quirks=04b4:0008:p solves the issue for the ZedBoard.

Best regards,
Michael
