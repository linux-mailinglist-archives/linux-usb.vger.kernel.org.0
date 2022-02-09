Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05024AF887
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 18:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbiBIRac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 12:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238359AbiBIRa3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 12:30:29 -0500
X-Greylist: delayed 307 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 09:30:29 PST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A287C05CB82
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 09:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644427464;
    s=strato-dkim-0002; d=aiyionpri.me;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=zegMAOBqMAaR2HLWXgZZq8DYKMi+V+WFbIvnTOcf/+A=;
    b=VF9HZ9heWI8VMyEXGBItlfP2uSMqsBvhNer3/Y5tOwZQs8KofOSiRQbC91c2oks9v9
    HhWPLI7QQ6xaCxAjfG+IFcdrHS5tZSeYhshhKzN6exchIh5NDA3sjMClr71dImoVfkjV
    N9rBUao8zgBqKD5dsyrOo6nz1I/2jvXveZ3z/ZyWNL6QvV7NG4U5M7VQAWixUuN04GxS
    HSwyLvwixF2VE7H1+NvJrpLms0gnnM3ag1KYL9Nypf4wEYzq40OeSXzKiOWmrJ6nhMya
    fjM1wKzlVvGqpNusp71xiN2gKesw/MHX/0O71haPzIEQwmxDpeAUhryzQX+kVUIT7Y6P
    VwHA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":IWkkdEmxcvCtRDtHUQOu48a0Nfy9hOkbpbRt4aM2x33iJsZ8F6ZSMCbAg3MdK/jjao1X9Kc4ERQQiBN20bbZsYRxt40KoK3n"
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2003:e7:9f15:774:28d7:7c3d:aa55:264e]
    by smtp.strato.de (RZmta 47.39.0 AUTH)
    with ESMTPSA id 0eaed6y19HOOfVd
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 9 Feb 2022 18:24:24 +0100 (CET)
Message-ID: <73db8832-7824-9aab-5c2a-d678806da5a4@aiyionpri.me>
Date:   Wed, 9 Feb 2022 18:24:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
Content-Language: de-DE
To:     Johan Hovold <johan@kernel.org>,
        Dmytro Bagrii <dimich.dmb@gmail.com>,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        Frank A Kingswood <frank@kingswood-consulting.co.uk>,
        Frank Zago <frank@zago.net>
References: <20220207000822.697343-1-dimich.dmb@gmail.com>
 <YgJHRKQHQheKTwjU@kroah.com> <6df2c9e6-8757-d5e4-0c27-d47f53bee2e1@gmail.com>
 <YgPNK1v541ohUMtv@hovoldconsulting.com>
From:   Jan-Niklas Burfeind <kernel@aiyionpri.me>
In-Reply-To: <YgPNK1v541ohUMtv@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm sorry, I did not notice this earlier;
will look into it tomorrow morning.

Thanks
Jan-Niklas Burfeind

On 2/9/22 15:18, Johan Hovold wrote:

> 
> It would be good if Jan-Niklas could chime in too and confirm if he's
> able to use the device in UART mode instead.
> 
> Johan
