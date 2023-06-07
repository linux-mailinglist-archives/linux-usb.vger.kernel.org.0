Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3EAB7254E7
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 08:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238472AbjFGG5o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 02:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235326AbjFGG5n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 02:57:43 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0BB11A
        for <linux-usb@vger.kernel.org>; Tue,  6 Jun 2023 23:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at;
 s=s31663417; t=1686121056; x=1686725856;
 i=christian.schaubschlaeger@gmx.at;
 bh=d4Y5Ez+sSz8LK7/ua1/lEIvGIGzE8AMrUHID8kG5sME=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=XMUiDh5HgAROQkFU/I5C1dE9cVbqAqOHrkdIL80wH56y5OvCNFNTsYQjsgNyDlfaMgsJLng
 YvLPWcVu1IkzsH5O40HLHVBwXPT3lC1qhkP8c5AfSEc0EbfBwyr0h7fgebNhLeL96cGhRMHOr
 y2X+HNwcpQNr9UN2PIMtzRx4yA7Zlg2Y2AAlIVg7ACD7zKrwYHYYAy5Uyn2wZGx1RdgYsJf6M
 UU6PWva3yOSo4jc96tF0Qw7T2OVhqVzK55ZAo7+mT4+Q7yEMlAOCLg6fWuLv1A7Jx92KTGk0S
 cdwd+jacPFQtMqPhcvKGQEUHsyTTZw72hOkNVqPqWDUZupwUPhTQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([88.116.17.66]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC30P-1qJ7yX0hlV-00CQsX; Wed, 07
 Jun 2023 08:57:36 +0200
Message-ID: <9dfe0a6b-a6d6-d21a-d23c-6f53fd535ccb@gmx.at>
Date:   Wed, 7 Jun 2023 08:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: USB issue on a TB4 controller?
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
 <20230530105039.GF45886@black.fi.intel.com>
 <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
 <20230530121756.GG45886@black.fi.intel.com>
 <a22f8874-c2b3-92a5-e858-b877872e5284@gmx.at>
 <894ba559-9233-4428-69e7-7c0bf5c7556e@gmx.at>
 <b45b5e8a-756e-fd76-64af-d3e376997a31@linux.intel.com>
 <618d9789-fc5a-10b3-6dc9-27be5bbff666@gmx.at>
 <dd62787f-a04c-01ce-6a16-6a116f0f9c3b@linux.intel.com>
Content-Language: en-US
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <dd62787f-a04c-01ce-6a16-6a116f0f9c3b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xpT9onmoGZEOgz1S5ABBgh+0dtxT3ZtlEuAM3A5o2yq1qwhjAPf
 h+4zaQl6jp3Fl02a141CZMi/hvg5GRTGMnv83yIs9I5mclTPvDadVQtXYUeoT8I4ZKl+N1W
 3E25nmevsZVim4HEP2WBaoAqQWlWr5y2NiR+a/kuVF+Uk5u0cqcKdonuMsl9n10uguTkyUw
 ZgN8VouGEzxboYxdeo1PQ==
UI-OutboundReport: notjunk:1;M01:P0:xio+LChGI2w=;u76ZYAzkRqZwpBOJqp0mXN4u+xT
 cv5A/PBk1FuBGF70r2wyUfMFFEhnfS88N9fFM8gUnVZJq7Z4KuiSEntFAg9JdAdQYiQQ0zEKN
 EpA/ninVWvklXMKuuKk0jfpGHuyiW1M0QiU/3WhBbkzgCzDt8DX0aDGTzQ1wmyfJs/2qvfh4v
 791OETHo/Mh0aU8FXxFtYLvFGuFDrKN+iKmBsoN2CY23FJUnfByohytZbix36cLq8iE5X35mi
 vZGgzC+aId/Vm4MXnSqbKlJuGDm/8ScoMzaCpfANiwq664XSyLE4ucBng18G5mFCTBVBEuvc7
 hdRccBaUyVAMTABtVFCLBM3HnoctBTmmO4LHGUVW2ATQsz3lPaxM/v3jEc0ti+uCo1bLsS4y/
 D7z/yUN603vdCUUyNIRiDuU5XxkNAOqFcuizT7w/EyvwBZoddZCff6YEQO/pBvDZcXT8Jv0hZ
 Rr1q4xA+yCTctZFjTjOnp85SCS9+a7TmnBTBH0Q8MqfgWx3hvAQnTSuS+ZAdQqb/2B5XfAr5B
 LMjAB4ljEE4QdUoKwb8HVX0V5RcN0j4Vh6Gkp2Oc2QNlKTjwfefd3pG9D0AgDODRZttIza/96
 TCdETCfCoWLmNwf9S83XFiqma8FQ2qessQ2o7GRVLKvECF758O43YxBWXcei7/PACXtMx0YxE
 orcIvQGyhqwAQELYAlvMTI1vOXg5aCPnChoMBvEBTy9NDor6T8ecbgYuK0mP7OjW3MOp8VnsG
 /OuSWk5H8seNJTuJfFe/IWeoAas7BUzjvVWTsrJOel65I/FRJ+pDxYnbcq4vkxeZThH0jA7un
 qIWh7pAQDJa+TdWOjt8QhoWqL4HbaOgbwmnaFPhn9CeCDUdH6ucvZUWagxlshBslu+SzHAQ/r
 gISwChVucDM5BzqSFzMwy3U95svJw9cK100UQQwnYXjZW6MqEj3KWjp50euaWqO2MdesExtym
 08cOPE2R/aw/5lM8ffLJaHxcgOw=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
> Thanks,
>
> In the failed case the hub in the dock doesn't show any activity
> on port4 where the NIC is connected. No changes, link isn't in any
> error state. It looks just like any empty port.
>
> I don't have any idea what's going on.
>
> I guess it's not possible to connect a protocol analyzer between the
> hub in the dock and the NIC?

No, I'm afraid I don't have a protocol analyzer...
Any other logs, etc. I could provide?

Thanks and best regards,
Christian


