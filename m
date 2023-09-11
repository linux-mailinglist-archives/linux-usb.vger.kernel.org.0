Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 521AC79BC22
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350636AbjIKVkI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243049AbjIKQpu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 12:45:50 -0400
Received: from mp-relay-01.fibernetics.ca (mp-relay-01.fibernetics.ca [208.85.217.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA07E4
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 09:45:45 -0700 (PDT)
Received: from mailpool-fe-02.fibernetics.ca (mailpool-fe-02.fibernetics.ca [208.85.217.145])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mp-relay-01.fibernetics.ca (Postfix) with ESMTPS id 306F2E1883;
        Mon, 11 Sep 2023 16:45:44 +0000 (UTC)
Received: from localhost (mailpool-mx-01.fibernetics.ca [208.85.217.140])
        by mailpool-fe-02.fibernetics.ca (Postfix) with ESMTP id 0B92E60A47;
        Mon, 11 Sep 2023 16:45:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.2
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from mailpool-fe-02.fibernetics.ca ([208.85.217.145])
        by localhost (mail-mx-01.fibernetics.ca [208.85.217.140]) (amavisd-new, port 10024)
        with ESMTP id BfbOjcxbikKh; Mon, 11 Sep 2023 16:45:43 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-209-188.dyn.295.ca [104.157.209.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dgilbert@interlog.com)
        by mail.ca.inter.net (Postfix) with ESMTPSA id 2071A601E4;
        Mon, 11 Sep 2023 16:45:42 +0000 (UTC)
Message-ID: <b503eb21-3850-0072-65b3-977be98e58d0@interlog.com>
Date:   Mon, 11 Sep 2023 12:45:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Reply-To: dgilbert@interlog.com
Subject: Re: [typec] pd: fixed source capability: peak_current field
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Saranya Gopal <saranya.gopal@intel.com>,
        linux-usb@vger.kernel.org
References: <9b87f828-cf1d-e370-f4ca-e0c53c9a35c5@interlog.com>
 <ZP8Z+1Kn+RagnFNq@kuha.fi.intel.com>
Content-Language: en-CA
From:   Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <ZP8Z+1Kn+RagnFNq@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2023-09-11 09:45, Heikki Krogerus wrote:
> +linux-usb ml, Guenter and others.
> 
> On Sun, Sep 10, 2023 at 09:29:04PM -0400, Douglas Gilbert wrote:
>> Hi,
>> The Peak current 2 bit field has been present in the fixed source PDO
>> since PD 2.0 . It is commented out in typec/pd.c with a note to revisit
>> as it needs the Operational current field from the active RDO.
>>
>> Not sure I agree with that: the 2 bit field is unit-less and could easily
>> be displayed as such. At the moment the active RDO is not directly
>> available through sysfs and would certainly be a useful addition for
>> many reasons.
>>
>> So my vote (not that I get one) would be to output peak_current in
>> sysfs with no unit. Then in the ABI peak_current could be explained
>> by reference to a table in the spec (e.g. "USB Power Delivery
>> Specification Revision 3.1, Version 1.8, table 6-10 Fixed Power
>> Source Peak Current Capability"). Then the issue of what it means
>> is handed off to the user space :-)
>>
>> Also of note is that the Peak current field is B21..B20 which is
>> below B23 (obviously) so all fixed source PDOs have that field
>> (and thus those unit-less values could differ), not just
>> PDO #1 .
> 
> I agree with you. I don't think it makes sense to try to interpret the
> peak current value in kernel, so we could just expose the value as-is.
> 
> But first giving the others heads-up on this, just in case somebody
> disagrees.

Similar situation with fast_role_swap in the fixed sink PDO. It is not really a
current but an index to a table embedded in the r31_v18's table 6-16.
Importantly the value 0 implies the sink does not support FRS. So again it
seems to be unit-less so the suffix "_current" in its sysfs name is
questionable. The spec does help much here formally naming it: the "Fast Role
Swap USB Type-C® Current" field in section 6.4.1.3.1.6 . The show function
for the fast_role_swap_current is defined in typec/pd.c but I didn't see any
invocations.

Doug Gilbert


