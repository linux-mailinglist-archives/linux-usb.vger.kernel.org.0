Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F56688095
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 15:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjBBOwm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 09:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjBBOwk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 09:52:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FEA918A4
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 06:52:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 545CEB82683
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 14:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030CDC433EF;
        Thu,  2 Feb 2023 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675349510;
        bh=+axHvPLutMO6UZ1H/Heuqcd+AIpsz7SuQzeiNjSZncc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JYtzrMo/H7HRj8h0753Ty2JX2KywfRItoVnl02zLVE0Ek1n9tpA6Mp1VADpDQwfmS
         zZMCllVBVR34COzTvXTd13l8TbKBG7eLm1ODnU9sxfDRjwQzIu3PqUtGJ67x4rijEX
         3myHi6k2xc4eGpPxwrmUGNniMOiILXRV41uzC9GdDTgp2Qk/Zp1pRmwsU3P2C7hg8u
         uzLbFiN9u+c6227tpY7iG+qQhYhiogaWWJwF5iSYRD75D0wEGVttvPFLvF0mkSz/9U
         IlMB1P7JScsEsMMs1+kvdTqDZJUfX0AqxHJ53sXrpphwZzpUkihuLA+F7En2YyxJCS
         ZQu5zT96wHdDw==
Message-ID: <87721ef2-e5f4-92e9-2991-abb4a2966587@kernel.org>
Date:   Thu, 2 Feb 2023 16:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Explicit status phase for DWC3
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
 <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
 <20230126235704.62d32y7y4sa4mmry@synopsys.com>
 <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
Content-Language: en-US
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 02/02/2023 12:12, Dan Scally wrote:
> (+CC roger as the author of the USB_GADGET_DELAYED_STATUS mechanism)
>=20
> On 26/01/2023 23:57, Thinh Nguyen wrote:
>> On Thu, Jan 26, 2023, Alan Stern wrote:
>>> On Thu, Jan 26, 2023 at 07:31:34PM +0000, Thinh Nguyen wrote:
>>>> On Thu, Jan 26, 2023, Dan Scally wrote:
>>>>> Hi Thinh
>>>>>
>>>>> On 26/01/2023 00:20, Thinh Nguyen wrote:
>>>>>> On Tue, Jan 24, 2023, Dan Scally wrote:
>>>>>>> Hi Thinh
>>>>>>>
>>>>>>>
>>>>>>> I'm trying to update the DWC3 driver to allow the status phase of=
 a
>>>>>>> transaction to be explicit; meaning the gadget driver has the cho=
ice to
>>>>>>> either Ack or Stall _after_ the data phase so that the contents o=
f the data
>>>>>>> phase can be validated. I thought that I should be able to achiev=
e this by
>>>>>>> preventing dwc3_ep0_xfernotready() from calling dwc3_ep0_do_contr=
ol_status()
>>>>>>> (relying on an "explicit_status" flag added to the usb_request to=
 decide
>>>>>>> whether or not to do so) and then calling it manually later once =
the data
>>>>>>> phase was validated by the gadget driver (or indeed userspace). A=
 very
>>>>>>> barebones version of my attempt to do that looks like this:
>>>>>>>
>>>>>> We shouldn't do this. At the protocol level, there must be better =
ways
>>>>>> to do handshake than relying on protocol STALL _after_ the data st=
age.
>>>>>> Note that not all controllers support this.
>>>>>
>>>>> Maybe I'm misunderstanding, but isn't this how the USB spec expects=
 it to
>>>>> work? Reading "Reporting Status Results (8.5.3.1)" in the USB 2.0 s=
pec for
>>>>> the status stage in a control write it says "The function responds =
with
>>>>> either a handshake or a zero-length data packet to indicate its cur=
rent
>>>>> status", and the handshake can be either STALL or NAK. If we can't =
do this,
>>>>> how else can we indicate to the host that the data sent during a co=
ntrol out
>>>>> transfer is in some way invalid?
>>>>>
>>>> My concern is from the documentation note[*] added from this commit:=

>>>> 579c2b46f74 ("USB Gadget: documentation update")
>>> When the gadget subsystem was originally designed, it made no allowan=
ce
>>> for sending a STALL in the status stage.=C2=A0 The UDC drivers existi=
ng at
>>> that time would automatically send their own zero-length status packe=
t
>>> when the control data was received.
>>>
>>> Drivers written since then have copied that approach.=C2=A0 They had =
to, if
>>> they wanted to work with the existing gadget drivers.=C2=A0 So the en=
d result
>>> is that fully supporting status stalls will require changing pretty m=
uch
>>> every UDC driver.
>>>
>>> As for whether the UDC hardware has support...=C2=A0 I don't know.=C2=
=A0 Some of
>>> the earlier devices might not, but I expect that the more popular rec=
ent
>>> designs would provide a way to do it.
>>>
>> Right, it's just a bit concerning when the document also noted this:
>> "Note that some USB device controllers disallow protocol stall respons=
es
>> in some cases."
>>
>> It could be just for older controllers as you mentioned.
>>
>>
>> Hi Dan,
>>
>> We should already have this mechanism in place to do protocol STALL.
>> Please look into delayed_status and set halt.
>=20
>=20
> Thanks; I tried this by returning USB_GADGET_DELAYED_STATUS from the fu=
nction's .setup() callback and later (after userspace checks the data pac=
ket) either calling usb_ep_queue() or usb_ep_set_halt() and it does seem =
to be working. This surprises me, as my understanding was that the purpos=
e of USB_GADGET_DELAYED_STATUS=C2=A0 is to pause all control transfers in=
cluding the data phase to give the function driver enough time to queue a=
 request (and possibly only for specific requests). Regardless though I t=
hink the conclusion from previous discussions on this topic (see [1] for =
example) was that we don't want to rely on USB_GADGET_DELAYED_STATUS to d=
o this which is why I had avoided it in the first place. A colleague made=
 a series [2] some time ago that adds a flag to usb_request which functio=
n drivers can set when queuing the data phase request. UDC drivers then r=
ead that flag to decide whether to delay the status phase until after ano=
ther usb_ep_queue(), and that's what I'm trying
> to implement here.

To give you some background on USB_GADGET_DELAYED_STATUS.

As per Mass storage bulk-only spec [3] Section 3.1,
"The device shall NAK the status stage of the device request until
the Bulk-Only Mass Storage Reset is complete."

So USB_GADGET_DELAYED_STATUS was introduced.

Note: wLength field set to 0 in the mass storage control request.
USB_GADGET_DELAYED_STATUS feature was limited only for this specific case=
=2E

As there is no data phase in the control request, the host
is simply waiting for an ACK packet when Reset operation is complete.

Without USB_GADGET_DELAYED_STATUS the mass storage function would
fail the USBCV mass storage compliance test at that time.


[3] https://www.usb.org/sites/default/files/usbmassbulk_10.pdf

>=20
>=20
> [1] https://lkml.org/lkml/2018/10/10/138
>=20
> [2] https://patchwork.kernel.org/project/linux-usb/patch/20190124030228=
=2E19840-5-paul.elder@ideasonboard.com/
>=20
>>
>> Regarding this question:
>> =C2=A0=C2=A0=C2=A0=C2=A0How else can we indicate to the host that the =
data sent during a
>> =C2=A0=C2=A0=C2=A0=C2=A0control out transfer is in some way invalid?
>>
>> Typically there should be another request checking for the command
>> status. I suppose if we use protocol STALL, you only need to send stat=
us
>> request check on error cases.
>>
>> Thanks,
>> Thinh

cheers,
-roger
