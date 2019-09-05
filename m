Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045C6AA651
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 16:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389913AbfIEOrD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 10:47:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39790 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbfIEOrC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 10:47:02 -0400
Received: by mail-wm1-f65.google.com with SMTP id q12so3405260wmj.4
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2019 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zXRGEZPwLtQ5UinxPXKU5BfJwpOCdWN4x79WEBjhqjE=;
        b=MBtV92rBa45246haRPT8qJPcyhwAnCzGKWvtch+yphLIQemMY/gh8rghP/zBtzfhZM
         cpNvyMRnAG5QKZHMWcZ9nGFEPxpgrPHlGg7/XLUNNd4u6wM+0FQ2prtdPxZeCyRUYgG/
         46UJM/NqDtwXc0nJ0q6SAb9xSMl58YKwCFKDbHGX/tVevKx8RK6diHCHAXeOi7MjI2lk
         PvYvOQTx7+W8Qrmx13NqWuMQHWS6psl1gN95m/d/GLgjEpPk3HC1Stf1IKA/Ps6h4Sa/
         B5GatoBEuuaROLE0BQKgN++QnG4MC66qo9gYpsjhhVJchmtowGwhpI1s78bjOcQhi51y
         c6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zXRGEZPwLtQ5UinxPXKU5BfJwpOCdWN4x79WEBjhqjE=;
        b=ONieUGTON2Wk/L59foi1WUg0NUKXEdPtj/jnwIGMfUznAoGlJaxTvIkRsnM8fS8npD
         sW56TVbQqwqyl7c1TFLv30SJ89TdIghkM+w4shg+ev2djoqMx+lH6nPPlTt5n9YPeobr
         Z7OweAsBsQ7DDGSKzQa89DvvnKJ+7UuVifwI3BtDWhxTn8hNVVef7Q3nP7ebI40rFZQ+
         e4R/vQhBMjYhuKAb6D/RvGWMLJwl7topaHgyXYRM6DV/qO1MTyqGAbm9QLRoPf4MbcDn
         7zlgSqGnAbzrfzo5rBeWRFViJM6cAX9wLN4bAukPB1pFfckw4k+cxMx7q/rLTjyvKOXG
         J2gg==
X-Gm-Message-State: APjAAAUHpxsTqvtmP+UwUlzbCbxuKZCAPHtaiVS+9fs+KFtunvJGggFk
        iPPRNEDDrr4FVHlL2oqbAxuEIA==
X-Google-Smtp-Source: APXvYqxrOWP3uRwxr+KtT9+/rUjsTzf8G+3Pk75+GnyZlEo2O+xCfU34WKNLUgQbN77l6Mtdb/VdMA==
X-Received: by 2002:a1c:ef13:: with SMTP id n19mr3424489wmh.48.1567694819611;
        Thu, 05 Sep 2019 07:46:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id y3sm3568846wra.88.2019.09.05.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 07:46:58 -0700 (PDT)
Date:   Thu, 5 Sep 2019 15:46:55 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        maco@android.com, sspatil@google.com,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules@vger.kernel.org,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v4 08/12] scripts: Coccinelle script for namespace
 dependencies.
Message-ID: <20190905144655.GB136369@google.com>
References: <20180716122125.175792-1-maco@android.com>
 <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-9-maennich@google.com>
 <CAK7LNARgxoXAABNXhO-LzxAm8rh6NJqAm9-iMo2=t2c_6_KXtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNARgxoXAABNXhO-LzxAm8rh6NJqAm9-iMo2=t2c_6_KXtQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 04, 2019 at 06:53:25PM +0900, Masahiro Yamada wrote:
>On Wed, Sep 4, 2019 at 12:07 AM Matthias Maennich <maennich@google.com> wrote:
>>
>> A script that uses the '<module>.ns_deps' files generated by modpost to
>> automatically add the required symbol namespace dependencies to each
>> module.
>>
>> Usage:
>> 1) Move some symbols to a namespace with EXPORT_SYMBOL_NS() or define
>>    DEFAULT_SYMBOL_NAMESPACE
>> 2) Run 'make' (or 'make modules') and get warnings about modules not
>>    importing that namespace.
>> 3) Run 'make nsdeps' to automatically add required import statements
>>    to said modules.
>>
>> This makes it easer for subsystem maintainers to introduce and maintain
>> symbol namespaces into their codebase.
>>
>> Co-developed-by: Martijn Coenen <maco@android.com>
>> Signed-off-by: Martijn Coenen <maco@android.com>
>> Acked-by: Julia Lawall <julia.lawall@lip6.fr>
>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Matthias Maennich <maennich@google.com>
>
>
>Without any correct dependency,
>this does not work.

You are right, 'nsdeps' needs to depend on 'modules' to make that work.
I will fix that in the next version.

>$ make clean; make nsdeps
>cat: modules.order: No such file or directory
>cat: ./modules.order: No such file or directory
>
>
>I do not see any point in the Makefile changes.
