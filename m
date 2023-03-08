Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B719E6B0D2A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 16:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjCHPo0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 10:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232045AbjCHPn7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 10:43:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE24CB076
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 07:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678290078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uo/FJj1NyWWIzu8ZaV5W6k3pTpM0E/M+diThcFqZLsU=;
        b=dVQ25tByGOjxSoKnt6SCUu2VBYakiL/K46wpF5aL9dNAynSSVFXB0jN9yLFcEnwktFsx97
        oJ2ANPQ58q6RMlKg7uWMl+HU+HFJN//0xiBxVRo7Q9ZfdItfxBeEYd3UpTqUC2FKOuKKWg
        DR70qvh24ELtBBURGdHOmiB0FmL9PxQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490---F3LIAaPdaDx1dZ8IGMbQ-1; Wed, 08 Mar 2023 10:41:17 -0500
X-MC-Unique: --F3LIAaPdaDx1dZ8IGMbQ-1
Received: by mail-ed1-f70.google.com with SMTP id d35-20020a056402402300b004e37aed9832so14976583eda.18
        for <linux-usb@vger.kernel.org>; Wed, 08 Mar 2023 07:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678290076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uo/FJj1NyWWIzu8ZaV5W6k3pTpM0E/M+diThcFqZLsU=;
        b=D/NoqiP7IbxOgKO65SGi2AyrzvyiJxeWO3yRGmITlD7gr0mTcnvXN3xCEiSbzVlk9z
         eckn60GN6MIR7lvaJwGjYttmAYlvgoYG4mkSUFQBzBLWqk/eds+pemKeZ4lbTVG47F4f
         Bsw+D+/7X9nt/WqA0HCMPCAVB68XLvBhpNFmquNkeXqajq6LTBjZjj8FJW6QjGEuYjI3
         Qb03HG9w1SpACj7kMZMpjMbjfcPnO5g2DcEGFaIi844IAZ5vfT+kqRI3a/gHRjGIqpxi
         cSUi/KGowUlgRmwL+AlzA+khhy153tRsJpJQVquz1qdKsQO1yut7ztqvO4Zs9opM81fE
         vnfA==
X-Gm-Message-State: AO0yUKVL+AHB73RNl53a3r/RmkHe6OJU1AcsdnogUid73BMJrGbjQo3Y
        n0n2mGUH6IKPhQvr3LC0CqyiFdQVhYmZf0WPyDwC/xLHyMEWzrLRmgykNlim34NRG1yItxqWRAN
        TjToW34oconC5KTSsXUm6
X-Received: by 2002:a17:906:d28c:b0:8e5:88ca:ebac with SMTP id ay12-20020a170906d28c00b008e588caebacmr18273818ejb.40.1678290076501;
        Wed, 08 Mar 2023 07:41:16 -0800 (PST)
X-Google-Smtp-Source: AK7set8Erw9KZCN2gpQm9RxYBdPz3pQC1p8AmgJbv+yXUywJqZjMTGEYSFuokOdDb1SL9rG7IcJjyA==
X-Received: by 2002:a17:906:d28c:b0:8e5:88ca:ebac with SMTP id ay12-20020a170906d28c00b008e588caebacmr18273802ejb.40.1678290076222;
        Wed, 08 Mar 2023 07:41:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v5-20020a1709063bc500b008c327bef167sm7595126ejf.7.2023.03.08.07.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 07:41:15 -0800 (PST)
Message-ID: <09ae066c-7306-1cb3-7cb0-f3ca597290f6@redhat.com>
Date:   Wed, 8 Mar 2023 16:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/3] usb: ucsi: Fix ucsi->connector race
Content-Language: en-US, nl
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, stable@vger.kernel.org
References: <20230307103421.8686-1-hdegoede@redhat.com>
 <20230307103421.8686-3-hdegoede@redhat.com>
 <ZAiNgJnNtvPEdIVO@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZAiNgJnNtvPEdIVO@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 3/8/23 14:28, Heikki Krogerus wrote:
> On Tue, Mar 07, 2023 at 11:34:20AM +0100, Hans de Goede wrote:
>> ucsi_init() which runs from a workqueue sets ucsi->connector and
>> on an error will clear it again.
>>
>> ucsi->connector gets dereferenced by ucsi_resume(), this checks for
>> ucsi->connector being NULL in case ucsi_init() has not finished yet;
>> or in case ucsi_init() has failed.
>>
>> ucsi_init() setting ucsi->connector and then clearing it again on
>> an error creates a race where the check in ucsi_resume() may pass,
>> only to have ucsi->connector free-ed underneath it when ucsi_init()
>> hits an error.
>>
>> Fix this race by making ucsi_init() store the connector array in
>> a local variable and only assign it to ucsi->connector on success.
>>
>> Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - Assign connector[i].index before calling ucsi_register_port() instead of
>>   passing i to ucsi_register_port()
> 
> You forgot to rebase this. It does not apply.

Ugh my bad, sorry about that. I'll send out a v4 fixing this.

Regards,

Hans


