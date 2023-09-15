Return-Path: <linux-usb+bounces-180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA07A2AE5
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4772821A8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 23:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF431BDCE;
	Fri, 15 Sep 2023 23:13:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786601B264
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:13:11 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A964B196
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 16:13:08 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1qhHzl-0007Xg-Mt; Sat, 16 Sep 2023 01:13:06 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qhHzk-003sWC-AA; Sat, 16 Sep 2023 01:13:04 +0200
Date: Sat, 16 Sep 2023 01:13:04 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Avichal Rakesh <arakesh@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Jayant Chowdhary <jchowdhary@google.com>,
	"Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Message-ID: <ZQTlAGuGw3bTFiLs@pengutronix.de>
References: <20230615093406.80195-1-dan.scally@ideasonboard.com>
 <20230615171558.GK741@pendragon.ideasonboard.com>
 <dbf1e426-cf86-46c4-afb9-9d6983f0fb6d@google.com>
 <ZPXrceImaT9GevmA@pengutronix.de>
 <CAMHf4WJ6hBEzPUCOX8wbnGZ7pUuG1a+mwR3h=d6=kyyf9W7p+g@mail.gmail.com>
 <ZP5kOcuKykSY8ycr@pengutronix.de>
 <df65040f-fbd9-4e9a-be38-1e30f7f613d4@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rlnRXAcd4TUYimXE"
Content-Disposition: inline
In-Reply-To: <df65040f-fbd9-4e9a-be38-1e30f7f613d4@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:2:b01:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
Subject: Re: [PATCH] usb: gadget: uvc: Move usb_ep_disable() to
 uvcg_video_enable()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.whiteo.stw.pengutronix.de)
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--rlnRXAcd4TUYimXE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avichal

On Mon, Sep 11, 2023 at 09:26:09PM -0700, Avichal Rakesh wrote:
>On 9/10/23 17:50, Michael Grzeschik wrote:
>> On Fri, Sep 08, 2023 at 11:54:40PM +0800, Avichal Rakesh wrote:
>>> Apologies for the late reply, I have been out travelling.
>>> On Mon, Sep 4, 2023 at 10:36=E2=80=AFPM Michael Grzeschik <mgr@pengutro=
nix.de> wrote:
>>>> Cc'ing: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>>>
>>>> ...
>>>> I am currently trying to solve that by preparing a patch that is
>>>> fixing the use of the requests when deallocating them. Since currently
>>>> the uvc_gadget is also running into wild use after free issues because
>>>> of exactly that async dequeue and dealloc situation.
>>>
>>> Do you already have a patch up for this? It seems my LKML-fu is
>>> failing and I can't seem to find the thread. If you aren't too deep
>>> into the patch, can you take a look at the request counting mechanism
>>> added in my patch? If you have a (somewhat) consistent repro of the
>>> use-after-dealloc issue, runnin it through the whole patch would be
>>> very appreciated! It is supposed to fix the exact problem you've
>>> described.
>>
>> I just send out v1:
>>
>> https://lore.kernel.org/linux-usb/20230911002451.2860049-1-m.grzeschik@p=
engutronix.de/
>
>Thank you for the patch. I do have a few comments on it, will respond on t=
hat thread.

Thanks for the comments.

>>
>> My patches did go back and forth between changes in the uvc-gadget
>> driver and the device-controller driver. My latest version was including
>> calling free_request from the complete handler. I found that option
>> while looking into the uac2 gadget code. It took away a lot of
>> pain while trying to fix the issue in the dwc3 gadget driver.
>>
>>>> IMHO it should be
>>>> save to call dealloc after calling dequeue. Which is probably true for
>>>> other usb device controller driver other then dwc3.
>>>
>>> Perhaps Thinh or someone better versed in Gadget API can chime in on
>>> this, but as it stands usb_ep_dequeue specifically says that it is
>>> async, and gadget drivers must wait on the complete callbacks to
>>> regain ownership of the usb_request. Until the API change is made, UVC
>>> should adhere to the current API?
>>
>> Since you mention that usb_ep_dequeue is async I am very confident
>> that it is safe to free the request in the completion handler.
>>
>> Although we could cleanup and improve the uvc_video_free_requests
>> function itself. But with the patches I have here the use
>> after free was gone so far. So they should be good so far.
>>
>>>> For some background. The dwc3 is putting the requests into a cancelled=
 list
>>>> that will be cleared by the interrupt handler and that is dequeuing th=
em
>>>> instead. In between the dequeue call and the interrupt call the uvc la=
yer could
>>>> dealloc the request which leads the interrupt handler to dequeue an
>>>> already freed request.
>>>
>>> This roughly tracks with what I gleaned from skimming the DWC3 code as
>>> well. In local tests the complete calls were always timely and I never
>>> actually ran into the situation where UVC deallocated an unowned
>>> request, but as someone (I think it was Alan?)=C2=A0 said in a previous
>>> thread: technically possible just means it will happen eventually
>>>
>>> Please do review/test the patch. I'll send out a formal patch on
>>> Monday once I am back, but would love to have some early eyes take a
>>> look in case there is something obvious I missed.
>>
>> First I tested your patch with my sketchy setup where I more then once
>> run into the use after free condition. But with the patch this was not
>> gone.
>
>Just to confirm, use-after-free issue was _not_ fixed with this patch?

Yes, it did somehow not help the issues I see.

I will come back with the issues I saw on your actual patch series.

>> I also looked over the patch. As what I saw this is a possible
>> alternative to my patches. The changes are doing some similar things.
>> But the code is changing to many things at once. Please split the code
>> up into more logical chunks. Perhaps you could try to rebase it on
>> my patches. And start from there.
>
>You're right, there are two issues this patch fixes. One of which is the
>same as that fixed by your series of patches. Uploaded v1 of the series at
>https://lore.kernel.org/20230912041910.726442-1-arakesh@google.com/
>(cc'ed to you) which splits the fixes into two separate patches.

Thanks for seperating them.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--rlnRXAcd4TUYimXE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUE5P0ACgkQC+njFXoe
LGQO/Q//Qb3nD1enbzZLjVI3UhqFbNmCd8WO1gZlwQyN7MS4FEbpKlTu3jKHxCyL
qJQ8yq/bnKpMZoeh+fQH/xNxHgV4zjN2LuuBN3xZc62er9ZV22Wlh1yn91/frt27
PyjsDBkSUiSh2kk4sugzoSyxGfpXuMaJjynqTNXjw3mXH6KdiePusvNlWwDm2a7t
UQrsUnj71LmoRB6/LaM8bnUh3VoxRse38nF/plxGNgzEdjMY29IexkV2MSc07EPi
nyfGOuar6ctQXFFJsDdtk4+oCsTaVXMNdjnip0DWiZAXAoaPpdyTKCBJpn+D3MM6
Z4zaz/2vpAdeB9/X0WWeB1Trbry1uT0kfdQcjfCoN1UIaMdngu+HDCaa4u5S6ca4
fYbk5n5ewlLOoZCnIm/vpijQpWzM7Iw0wRlsSQe+GLtyHuHMwWue3rzb/bvDOrCm
IofS4teJ1Tn43VZYiRW9R8bS88hdBj/mB3dEfd2eaBgMZT78WgSNentrdtsS9hOB
akpUye9JXoWvKw/Xvts1jOQB+FlBby5EtnsvszPwkKmanRhJYO1YYy9y6sNwD84r
scj5IuePAAPu6rpfurSvVG0ONafADgOzKhJ06clyBcdaLPszW+FI+VCe6siOKOsy
B7UfnnbIVGdO6SWbT1h2DKo1j/28n2z0kC04w9pDn5NyyVuG8No=
=WHt4
-----END PGP SIGNATURE-----

--rlnRXAcd4TUYimXE--

