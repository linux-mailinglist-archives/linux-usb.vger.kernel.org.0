Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54410642830
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 13:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbiLEMO1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 07:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbiLEMO0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 07:14:26 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A394FAA
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 04:14:25 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B219660035C
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 12:14:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1670242464;
        bh=WBSqsP2fQFp/E2vmRZi+0kI2XABSo2phA0mSl5rW4f8=;
        h=Date:To:From:Subject:From;
        b=Hfl7dj6lOZwntJeSGJRy8fegsvtXGAAZ9tziqlYd7VDWQlJi+WNzP47JaNMbgH9NK
         +CA5aGOQrbJadGJIJ/PT7zA+2VsAWQaBp8uBVwJYQCRVoWHBID1GN1ILCS0U/kSrbH
         T3DMaZNF7GvUeMVEn8YScwBdK68h6mUw6+gwBSW+/7kTisUouZaekwnt286ehe9WI8
         mKFBj+x1g2iKdmRogjabi3SH+z7mBibBWx487/j6UjOytfDhlaXOrGXwcaYkgbzdn6
         cW6L9SfnMYCmA1vhXFLip67yd9bxUziNhebSbx+GiCOall0CqBN7owDgeDxvAgX+L5
         bgpdHCAO9x+mA==
Message-ID: <266f2df3-75cf-5dcf-1e59-8a8da5dd001e@collabora.com>
Date:   Mon, 5 Dec 2022 13:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [RFC] Unify messaging in gadget functions
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

include/linux/usb/composite.h contains:

/* messaging utils */
#define DBG(d, fmt, args...) \
	dev_dbg(&(d)->gadget->dev , fmt , ## args)
#define VDBG(d, fmt, args...) \
	dev_vdbg(&(d)->gadget->dev , fmt , ## args)
#define ERROR(d, fmt, args...) \
	dev_err(&(d)->gadget->dev , fmt , ## args)
#define WARNING(d, fmt, args...) \
	dev_warn(&(d)->gadget->dev , fmt , ## args)
#define INFO(d, fmt, args...) \
	dev_info(&(d)->gadget->dev , fmt , ## args)

Gadget functions do use these, but not consistently:

=> DBG() vs dev_dbg():
$ git grep DBG\( drivers/usb/gadget/function | grep -v VDBG | grep -v LDBG | wc
     138     871   11619

$ git grep dev_dbg\( drivers/usb/gadget/function | grep -v "##args" | wc
      33     151    2831

=> VDBG() vs dev_vdbg():
  git grep VDBG\( drivers/usb/gadget/function | grep -v "#define" | wc
      49     269    3954

$ git grep dev_vdbg\( drivers/usb/gadget/function | wc
       2       4     135

=> ERROR() vs dev_err():
$ git grep ERROR\( drivers/usb/gadget/function | grep -v LERROR | wc
      72     508    6560

$ git grep dev_err\( drivers/usb/gadget/function | grep -v "##args" | wc
      65     309    5527

=> WARNING() vs dev_warn():
$ git grep WARNING\( drivers/usb/gadget/function | wc
       4      28     383

$ git grep dev_warn\( drivers/usb/gadget/function | grep -v "##args" | wc
       3       6     169

=> INFO() vs dev_info():
$ git grep INFO\( drivers/usb/gadget/function  | grep -v LINFO | grep -v u_ether 
| wc
      14      64    1167

$ git grep dev_info\( drivers/usb/gadget/function | grep -v "##args" | wc
       0       0       0

Questions:

1) Should we make them use the messaging utils consitently?

2) How consistent should we become, given that some functions in the relevant
files, for example u_audio_start_capture(), sometimes (but not always) have:

	struct usb_gadget *gadget = audio_dev->gadget;
	struct device *dev = &gadget->dev;

and then they use dev_dbg(dev, ....);

If we were to use DBG(audio_dev, ....); instead, then we effectively get
dev_dbg(&audio_dev->gadget->dev, ....); after macro expansion, which means two
pointer dereferences and taking an address of the result (I'm wondering how
smart the compiler can get if such a pattern repeats several times in a
function).

3) Maybe the amount of various messages is too large in the first place
and should be reduced before any unifications?

Regards,

Andrzej
