Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B4127BB2E
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgI2Cws (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:52:48 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:32793 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726961AbgI2Cws (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:52:48 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 4B4145C010E;
        Mon, 28 Sep 2020 22:52:47 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute6.internal (MEProxy); Mon, 28 Sep 2020 22:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm2; bh=6uUdMUTmgUmYSiNjo9IBiO58icJ17lt
        2Oe2WfepqpK8=; b=aXCBnwPwcJF0vt2UOK3kYvKMkyWSEN1PaNCjuVtnaQqKONa
        1qSQh/7W3HjsE/aOqGbSq9Mh5lB3aWkoDqodLRM2MTbc5ab28AI4IqxPyG0pA/bW
        7AbxxlIWhi4wccW1XVGH82BTYgd10osltkhR7XjvzNNvZPbIuYD+DITsclWnCoi6
        udnk9enZz0C2UiBE3zqjiiyAr9eeCtWqL51iZMMtjRXtvurm3dQficJjThNg8k6O
        hvZjZv39ClrOeNbUPYGONHyNBGb6UwKXmUrYubEnm6IJ5l3nMuWl6hSM3+GHlQfk
        waZxOrWqqZfRMr8y2qYNtdLhqGst1v5ioyRTQDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6uUdMU
        TmgUmYSiNjo9IBiO58icJ17lt2Oe2WfepqpK8=; b=WqgAzacBAtpCRkIRC/FT+l
        8qBhOJafvjAVu6O4/MhjdsEhMM3co1hwyD8vbEf1H1r4suU8Gj4bLHGTTJovRKaw
        uJLVQh4G6nh7YUla9t2mZssPA4IwakloeTcJw/Sj0AcXhQCmPwwNRNZ8eONg2oNl
        cMN74SUy1BWPF9IVs1OYFxFzpqvej8RZbEIOvnyqltC6fQV7YooLxkjEBVpnOpdy
        rQJdbAUIWa2cYlQfCbgV3uOyoHi+3LbbSQkZ4NDCG98z12VZ8J58A9d0S9/JXbJL
        LlQwAXiXoX2F/3F+kvYenSurW/SzuHVPAW8bBqRF34UHIXowoV/kKn0DMvdgDNjA
        ==
X-ME-Sender: <xms:fqFyX_1U7c42BmvBK7N-srwjAfl_EzqIgHxGxNgWO05VySPkJ0mwTQ>
    <xme:fqFyX-GZmlyW38qjR_wlsPt_2Er_xYmV_By1PQFyNKddvK3Oaw86RL4yXsKoU3mKV
    wtS3kGabyAoFVchWqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdejgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfufhiugcu
    ufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeegfedttd
    fgudffvdegudegleekleejfeeuhefhjeeghfefvdekveeufffgiedvveenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruh
    hs
X-ME-Proxy: <xmx:fqFyX_4C4EQv8ugb2_Nu-xBVsr8RPtkLZPzwSur-vS4Tkg8gYBzStg>
    <xmx:fqFyX03mHOGfj1lkZ44hOt21P9-7zM0eWvHGbYpo1IlH5wcthXG7SQ>
    <xmx:fqFyXyEBdyErKIygD0a2AoLfnNiAGVNQqEZRs7SLkgdOnf-q-1ecog>
    <xmx:f6FyX9zHyWEGh21O9WEegy88GsmdtI6ieGqZ8Fn16zy3qL-FNUPqTw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DBFBC660069; Mon, 28 Sep 2020 22:52:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-355-g3ece53b-fm-20200922.004-g3ece53b9
Mime-Version: 1.0
Message-Id: <6e4fe5a7-5088-4b31-9477-9cdb2ad83f9d@www.fastmail.com>
In-Reply-To: <20200825055505.765782-2-lorenzo@google.com>
References: <20200825055505.765782-1-lorenzo@google.com>
 <20200825055505.765782-2-lorenzo@google.com>
Date:   Mon, 28 Sep 2020 21:52:08 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Lorenzo Colitti" <lorenzo@google.com>, linux-usb@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_v3_1/3]_usb:_gadget:_f=5Fncm:_fix_ncm=5Fbitrate_for?=
 =?UTF-8?Q?_SuperSpeed_and_above.?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 25, 2020, at 12:55 AM, Lorenzo Colitti wrote:
> Currently, SuperSpeed NCM gadgets report a speed of 851 Mbps

I apologize for hijacking your patch message, but on what hardware
are you testing? I've been trying to find USB3 device-mode-capable
hardware for ages.
