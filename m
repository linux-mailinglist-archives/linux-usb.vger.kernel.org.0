Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FE846DAD4
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 19:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238710AbhLHSRe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 13:17:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbhLHSRe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 13:17:34 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693F7C061746;
        Wed,  8 Dec 2021 10:14:01 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u1so5481818wru.13;
        Wed, 08 Dec 2021 10:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YAH0/us2xqzbXq7gp3ubTBdl9r4CUX/dnOqdJ3pk+RQ=;
        b=qbxZaTgi/Gu+bhtDm8OHW7GAQTYAld/WqcbE8s71ZDsGqOQ+pijf4khIqhrz53oGnx
         mbp9adL26lvJ9O4iFRxiVD50W1AoBGqHWQlEXt8W/Gib83xk9K+IsJFzW9XUomCXqAcH
         ar0dsw7ZAMq3Rn1y2OQy0MqhMi1urhq6T5GPlP/orMM0z2mlvXj51PK98d7/+BGf+JmW
         eDOfegbjecwOc+NMa8h2a+S0eolWIsTmt2PQADCl2okC5FeDW3zio6s3i4DSL/nbla+2
         q1KezWjeJZryk9T+JU0p6qqj54G27z5a/HX6UwLloIVqxXGR+0GgwCrr3n2oPzrHSIVJ
         +ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YAH0/us2xqzbXq7gp3ubTBdl9r4CUX/dnOqdJ3pk+RQ=;
        b=SYi3hoI4wk1SJ1ZczHee6AbV82O73zy61frqSbqiz7nI0lDsz9wbftmS93L80GRuK4
         MkbjdwFamA/Ec0G4N9+tVbUtEgoQBDw+WYggzFGYSe2BfO8qkQwc0ERFLBzC8WxkaDi8
         0eqZ4M+g+9FneLFve31oLCSVrN1kBU+uaXkxcjM8nETo8Y7JWh5ZbkKBmXurkjg9s5F2
         K3S0LMDWHSiZSvpospc/K9DIO6B6HgLbhbQYhD/NnwNS/c7UTow171ARZChsy631m/PG
         G5xkfOwoNf9YejUD8LKIfpNREEv9HAbJHx9J2XN150hQIEOunr7+4LTdz7mNifgd/a/1
         wV9g==
X-Gm-Message-State: AOAM53117HdrdJ3x0F1kcw3aprxq9oHn4AG0vYJf6Y/2V5SmKR+AsOEs
        heP87OZbFl7HPvK9XFezuBKz7hjFBnBKjQ==
X-Google-Smtp-Source: ABdhPJy5CAcukXKPiW4E0q9abTqbPf5N/EaEhK5Tn4S/yK0gIWmcpmpG8W/eyRzbXzbe5YsfmjS1bg==
X-Received: by 2002:a05:6000:82:: with SMTP id m2mr358251wrx.202.1638987240071;
        Wed, 08 Dec 2021 10:14:00 -0800 (PST)
Received: from ?IPv6:2003:c7:8f4e:636:1c76:d6f:eb4:9f5b? (p200300c78f4e06361c760d6f0eb49f5b.dip0.t-ipconnect.de. [2003:c7:8f4e:636:1c76:d6f:eb4:9f5b])
        by smtp.gmail.com with ESMTPSA id z8sm3532839wrh.54.2021.12.08.10.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 10:13:59 -0800 (PST)
Subject: Re: proposal to delete the skeleton driver
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, tytso@mit.edu,
        Greg KH <gregkh@linuxfoundation.org>
References: <df5bb0a6-e5f5-e062-5c02-e1de612058e2@suse.com>
From:   Philipp Hortmann <philipp.g.hortmann@gmail.com>
Message-ID: <d1797628-9782-ba76-9eff-f400f9aa2446@gmail.com>
Date:   Wed, 8 Dec 2021 19:13:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <df5bb0a6-e5f5-e062-5c02-e1de612058e2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/7/21 11:16 AM, Oliver Neukum wrote:
> Hi,
> 
> it seems to me that the method of maintaining an example driver
> does not work because it will inevitably be
> 
> * untested
> 
> * out of date
> 
> Thus our documentation would be improved by replacing its examples
> with code from drivers for real hardware. Such code wouldn't be pretty
> or written for text books, but it would be tested.
> I could do it this week in a first proposal. But I don't want to start
> if somebody feels that the skeleton driver absolutely has to stay.
> 
>      Regards
> 
>          Oliver
> 

My wish is that it is only deleted when you have something similar as 
proposed by Ted.

I have tested the driver during the last three month. I used different 
devices. The best one was a USB to serial adapter, as it has the by the 
driver expected bulk in and out endpoints. In the skel_open() I was 
putting in an initialization and was able to set RTS and other signals 
on the RS232 side. I was also able to test the usb_bulk_msg() receiving 
example for my patch…

I truly believe that it has issues. But it is usable.

I liked that it is a character device and that it is one file and not 
distributed among many files.

Regards
Philipp
