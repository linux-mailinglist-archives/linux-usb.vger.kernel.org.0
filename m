Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADA55FBEBA
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 02:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiJLAlT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Oct 2022 20:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJLAlS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Oct 2022 20:41:18 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E1D3F30B
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 17:41:17 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id p3-20020a17090a284300b0020a85fa3ffcso530245pjf.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 17:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwhQ5WFaoPG0AlRp8hkNmn+Kxlye0A5w1E2PIg0K7iQ=;
        b=Kl/34niwW9iDATvh7O4XDSu0LfbYCRB5CWlgXI+CjUT30lMO0pIz5nfqdgKyDy1Pwc
         PwbBc8Y7HwUY1Qr9zJA7gi1fiMlGeL7K8tYTn0FrT3uTOA02RN1p10uvy7H+fQ5IzwM4
         17kkgXQoqtaak3KzS6HHHf8P+Zinup+7VrJW1mvGY2H8ZJTiiUjnsERU2jaYIqSX/5pt
         5VgOLzkBDVhNNOQcIl3PH9uFfaClGAK6ewXlYj7pMd6RgknREDMNflnpL9Dyh2inaPMY
         /W59Izv55hgIwMX+ZaqSoR0kUFUmh4EmxqgiZ3zgOvBwPIahgeXstUawP+g0VQoovj2h
         5eTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwhQ5WFaoPG0AlRp8hkNmn+Kxlye0A5w1E2PIg0K7iQ=;
        b=ITtGKlrydIOMXj1UsKtU4zlcjWowxI133QQgopgTe5WbyB2Qr+ASmZKupQnpcEFZwA
         kZm34RxWDXIjj0GgiFRhbghtuVNHsdTn0fhavf4jxyHQgFF0JEcAsx0kkIdOiv3amwcB
         Su12trOwegNaSZJ8qKojKumlG7d4lcvu5B/07FrLCraYzk4DNf2Y8AC1CyIIhkdsbZZo
         mSFadMHoAG5VweX+q+R269K5K75zEfkbbNI6EW18ovDe6MM46mGlkqIiI9nyy3yR1IVM
         uIG0YpYvaxzjUSLAhG1RVv+o0u/PvBFp4uCr9DWloXNMfrWs6vhN1L2gFfjaIyVqGO4B
         gYQA==
X-Gm-Message-State: ACrzQf3tHWJBtxKjHSv/YYKLkiQZcL7Zhv1viTKdOTfJpbGr4JJIopAQ
        KwEIkYjFDwbRQpLiGPW8BJI=
X-Google-Smtp-Source: AMsMyM5BdzsxZpUYPdbVkCt+fgTqj60zrs+CGvtzAD68IjvfdmNJlhqha6WMbFwcFC0eDKUY0HcB4Q==
X-Received: by 2002:a17:90a:74c2:b0:20a:f63c:2464 with SMTP id p2-20020a17090a74c200b0020af63c2464mr2119522pjl.224.1665535276814;
        Tue, 11 Oct 2022 17:41:16 -0700 (PDT)
Received: from [192.168.1.5] ([159.192.82.83])
        by smtp.googlemail.com with ESMTPSA id e15-20020a63d94f000000b00461b85e5ad6sm4612291pgj.19.2022.10.11.17.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 17:41:16 -0700 (PDT)
Message-ID: <a87f60cb-271b-2f50-7ca0-1954fb14cad9@gmail.com>
Date:   Wed, 12 Oct 2022 07:41:13 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] USB: serial: option: the patch is meant to support
 LARA-R6 Cat 1 and LARA-L6 CAT 4 module family.
Content-Language: en-US
To:     Davide Tronchin <davide.tronchin.94@gmail.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
References: <20221011142008.3654-1-davide.tronchin.94@gmail.com>
From:   Lars Melin <larsm17@gmail.com>
In-Reply-To: <20221011142008.3654-1-davide.tronchin.94@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/11/2022 21:20, Davide Tronchin wrote:
> -	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
> -	  .driver_info = RSVD(3) },
> +	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b) }, /* u-blox LARA-R6 00B*/
> +	/* u-blox products using u-blox vendor ID */


Your v2 patch does still not take into account that there are other 
companies re-selling this Qualcomm hardware and having a QMI direct net 
interface which you must blacklist when you add option support for this 
vid:pid.

Lars
