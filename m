Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88FDB5C2D2
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 20:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfGASWO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 14:22:14 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44412 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbfGASWO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 14:22:14 -0400
Received: by mail-lf1-f67.google.com with SMTP id r15so9427268lfm.11
        for <linux-usb@vger.kernel.org>; Mon, 01 Jul 2019 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lSeGwgb7OCHIZ0lDpAKilpMUUcD2EKTAejOKK6LikFQ=;
        b=e77hRdekb5Ksd1Rsj0fXd4QUcYSQWip33lsHjZwlobtp8hSu+bdm8BuUoQZg2SmIuJ
         HcgNgRizUQQRYmcssGQ0o5S8HyGblr9QKslVYYOZYOWRleFBchsDhgMg6/uztcIKPHyD
         Zrqsxt2BdK9G6bp0t5QftvWtOn650n+KpKpZtRUrmueqjheTJ+yOQqxddQGG4Z/60lKF
         45EIuSgi3v65Olqm0cCe4f3EkrSXZ+BedxDj4YNnubY8xsSOhrSrBw916twRg8mw7pt0
         ppKZCyVm1FZ9ojqssfg/Lup17kvQnUIdyqzVF+2oT3ZB4rQUK9TvIhbX4HarDNW+6t/D
         duYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lSeGwgb7OCHIZ0lDpAKilpMUUcD2EKTAejOKK6LikFQ=;
        b=Xaa2hiU8MyWksGsF4t6vCHwAxkIh/bxVlRFMKxgBcHpCVAH7ZKI5ss4pqZzg7at8Ux
         PUq3KcT4FEcrXIFWEKRitFRUrbKCx2eLMeOnatRIpfvT5Kv/qNyFfOXnwTa1ixXmoZ5V
         4pEzlqbfdqw4qflmzh60H4QFgisOAyfY8VfdRV33wYxbA3al7xLiMi2iKI2/GonNoxl/
         zc9D9WncD+Wpd+po98yO8zL24kOPnN/H3Hh2e59ZCVyibWaaHSxjnzFRGo1tYQpBcn0F
         HQRZ3uaGUBiUiygkIk/6dOUjoILr9yJTmp/X3/Cwxp2T8eAJgssKNlhtmZoSHCXKQVnV
         zPEA==
X-Gm-Message-State: APjAAAVG7eTow0XCnSWS9sNSgYD0MusyfEhzr4yMGUJvSc1TWurVR3yi
        /stjZJ7EKQMaUTRCxW4BPdDZUHuAT9Q=
X-Google-Smtp-Source: APXvYqyfow0Cz9tRTvKd2g5VEUBaB2/RuakhGwviPW+ATrJ/ednC/dTkBxSiPl5lPrmuWhtNA+nY8Q==
X-Received: by 2002:ac2:482d:: with SMTP id 13mr12078669lft.132.1562005332513;
        Mon, 01 Jul 2019 11:22:12 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:87f:4d67:ad95:f728:cfaa:94d0])
        by smtp.gmail.com with ESMTPSA id p15sm3440617lji.80.2019.07.01.11.22.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 11:22:11 -0700 (PDT)
Subject: Re: [PATCH] USB: gadget: function: fix issue Unneeded variable:
 "value"
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190701182031.GA10455@hari-Inspiron-1545>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <746df16a-0e8d-bae7-36ff-5827610dfd99@cogentembedded.com>
Date:   Mon, 1 Jul 2019 21:22:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190701182031.GA10455@hari-Inspiron-1545>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 07/01/2019 09:20 PM, Hariprasad Kelam wrote:

> fix below issue reported by coccicheck
> drivers/usb/gadget/function/f_eem.c:169:7-12: Unneeded variable:
> "value". Return "- EOPNOTSUPP" on line 179
> 
> We can not change return type of eem_setup as its registed with callback

   Registered.

> function
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
[...]

MBR, Sergei

